local ScoreManager--referencia externa de ScoreManager

--- Modulo encargado del manejo de funciones principales del juego
local QuestionManager = {
	Data = require(game:GetService("ServerScriptService").Server.Modulos.GameData),
}

QuestionManager.chronoPreguntas = function(tiempoPorPregunta)
	local setTiempoJuego = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetTiempo")

	-- Inicia un cronometro para las preguntas, este tiempo sera en segundos y PARA TODOS LOS JUAGAODRES, el cual se les
	-- enviara mediante un evento remoto a su interfaz, cada segundo cambiara el tiempo restante
	local evVisual = 0 -- algo a implementar mas adelante @TODO
	for tiempoRestante = tiempoPorPregunta, 0, -1 do
		-- Enviar el tiempo restante a todos los jugadores
		setTiempoJuego:FireAllClients(tiempoRestante, evVisual)
		task.wait(1)
	end
end

QuestionManager.ruletaTemas = function()
	-- Obtiene la lista de temas disponibles
	local temasDisponibles = {}
	for nombreTema, _ in pairs(QuestionManager.Data.Preguntas) do
		table.insert(temasDisponibles, nombreTema)
	end

	-- Verificacion de que haya temas disponibles
	if #temasDisponibles == 0 then
		warn("ruletaTemas: no hay temas disponibles")
		return nil
	end

	-- Seleccion aleatoria de un tema
	local numRand = Random.new()
	local indiceAleatorio = numRand:NextInteger(1, #temasDisponibles)
	local temaSeleccionado = temasDisponibles[indiceAleatorio]

	print("Tema seleccionado por la ruleta: " .. temaSeleccionado)
	return temaSeleccionado
end

QuestionManager.setPoolPreguntas = function(tema, cantidadPreguntas)
	-- Obtiene todas las preguntas del tema (todas las dificultades), las mezcla y devuelve 'cantidadPreguntas'
	local temaTabla = QuestionManager.Data.Preguntas[tema]
	if not temaTabla then
		warn("setPoolPreguntas: tema no encontrado -> " .. tostring(tema))
		return {}
	end

	-- Aplanar preguntas de todas las dificultades
	local todasPreguntas = {}
	for _, listaDificultad in pairs(temaTabla) do
		for _, pregunta in ipairs(listaDificultad) do
			table.insert(todasPreguntas, pregunta)
		end
	end

	-- Aqui se mezclaran usando Fisher–Yates con Random.new()
	local numRand = Random.new()
	for i = #todasPreguntas, 2, -1 do
		local j = numRand:NextInteger(1, i)
		todasPreguntas[i], todasPreguntas[j] = todasPreguntas[j], todasPreguntas[i]
	end

	-- Se seleccionan la cantidad solicitada (o todas si es que hay menos)
	local seleccionadas = {}
	local limite = math.min(cantidadPreguntas or #todasPreguntas, #todasPreguntas)
	for i = 1, limite do
		table.insert(seleccionadas, todasPreguntas[i])
	end

	return seleccionadas
end

QuestionManager.boolPreguntas = function(players, valor)
	local boolPreg = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("BoolPreguntas")
	for _, player in ipairs(players) do
		boolPreg:FireClient(player, valor)
	end
end

QuestionManager.getRespuestaJugador = function(respuestaActual, ScoreManagerRef)
	local verResp = game:GetService("ReplicatedStorage").Remotes.Functions:WaitForChild("CheckResultado")
	verResp.OnServerInvoke = function(player, respuesta, tiempoResp)
		local calcPunt = 100 + (tiempoResp * 2)
		if respuestaActual == respuesta then
			-- print("Respuesta correcta del jugador: " .. player.Name)
			QuestionManager.boolPreguntas({ player }, false)
			if ScoreManagerRef and ScoreManagerRef.addPoints then
				ScoreManagerRef.addPoints(player, calcPunt)
			end
			return calcPunt
		else
			-- print("Respuesta incorrecta del jugador: " .. player.Name)
			QuestionManager.boolPreguntas({ player }, false)
			if ScoreManagerRef and ScoreManagerRef.addPoints then	
				ScoreManager.addPoints(player, 0)
			end
			return 0
		end
	end
end

QuestionManager.showUI = function(players, mostrar)
	local uiOpt = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("ToggleUI")
	for _, player in ipairs(players) do
		uiOpt:FireClient(player, mostrar)
	end
	-- @TODO: Implementar animaciones de entrada/salida de la UI
end

QuestionManager.initQuiz = function(tiempoJuego, numeroPreguntas, players, ScoreManagerParam, onFinish)
	print("[QuestionManager] Inicializando QUIZZ")
	
	ScoreManager = ScoreManagerParam

	-- Imprimir los jugadores en el quiz
	for _, player in ipairs(players) do
		print("Jugador en el quiz: " .. player.Name)
		QuestionManager.showUI({ player }, true)
	end

	-- En esta parte juntaremos la logica de la pool de las preguntas, respuestas del jugador, etc
	local tema = QuestionManager.ruletaTemas()
	local poolPreguntas = QuestionManager.setPoolPreguntas(tema, numeroPreguntas)
	print(poolPreguntas)

	-- Aqui inicializamos las preguntas, mediante una UI, la cual tendra un frame para que el jugador vea la pregunta y las opciones
	-- la pregunta estara arriba y los botones abajo, el puntaje estara(obviamente unico para cada uno), todo esto lo gestionara mediante
	-- opcionesUI
	-- local SetPuntos = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetPuntos")
	local setPreguntas = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetPregunta")
	local setOpciones = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetOpciones")

	for _, preguntaData in ipairs(poolPreguntas) do
		-- Enviar la pregunta y opciones a los jugadores
		print(preguntaData.Pregunta)
		setPreguntas:FireAllClients(preguntaData.Pregunta)
		setOpciones:FireAllClients(
			preguntaData.Opciones.A,
			preguntaData.Opciones.B,
			preguntaData.Opciones.C,
			preguntaData.Opciones.D
		)
		QuestionManager.getRespuestaJugador(preguntaData.Correcta, ScoreManager)
		QuestionManager.chronoPreguntas(tiempoJuego)
		QuestionManager.boolPreguntas(players, true)
	end
	--terminamos el quizz
	if onFinish then
		onFinish()
		QuestionManager.reset()
	end
end

function QuestionManager.reset()
	print("[QuestionManager] Juego terminado reseteamos valores")
	--Aqui logica reseteando todo
	
end

return QuestionManager
