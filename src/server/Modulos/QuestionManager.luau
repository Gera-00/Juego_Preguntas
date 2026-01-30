local ScoreManager --referencia externa de ScoreManager

--- Modulo encargado del manejo de funciones principales del juego
local QuestionManager = {
	Data = require(game:GetService("ServerScriptService").Server.Modulos.GameData),
	playersCountAnswered = 0,
}

QuestionManager.chronoPreguntas = function(players, tiempoPorPregunta, cooldownBtPrg)
	local setTiempoJuego = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetTiempo")

	-- Inicia un cronometro para las preguntas, este tiempo sera en segundos y PARA TODOS LOS JUAGAODRES, el cual se les
	-- enviara mediante un evento remoto a su interfaz, cada segundo cambiara el tiempo restante
	local evVisual = 0 -- algo a implementar mas adelante @TODO
	for tiempoRestante = tiempoPorPregunta, 0, -1 do
		-- Checar si todos los jugadores ya respondieron para terminar el cronometro antes
		if QuestionManager.playersCountAnswered >= #players then
			QuestionManager.playersCountAnswered = 0
			print("[QuestionManager] Todos los jugadores respondieron, terminando pregunta...")
			setTiempoJuego:FireAllClients(0, evVisual)
			task.wait(cooldownBtPrg)
			break
		end
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
			QuestionManager.playersCountAnswered += 1
			return calcPunt
		else
			-- print("Respuesta incorrecta del jugador: " .. player.Name)
			QuestionManager.boolPreguntas({ player }, false)
			if ScoreManagerRef and ScoreManagerRef.addPoints then
				ScoreManager.addPoints(player, 0)
			end
			QuestionManager.playersCountAnswered += 1
			return 0
		end
	end
end

QuestionManager.showUI = function(players, mostrar, timeOff)
	local uiOpt = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("QuizUI")
	if mostrar then
		for _, player in ipairs(players) do
			uiOpt:FireClient(player, mostrar)
		end
	else
		for _, player in ipairs(players) do
			uiOpt:FireClient(player, mostrar)
		end
		QuestionManager.playersCountAnswered = 0
		task.wait(timeOff)
		print("[QuestionManager] Juego terminado...")
	end
	-- @TODO: Implementar animaciones de entrada/salida de la UI
end

QuestionManager.initQuiz = function(tiempoJuego, numeroPreguntas, players, ScoreManagerParam, onFinish)
	print("[QuestionManager] Inicializando QUIZZ")

	ScoreManager = ScoreManagerParam

	-- Imprimir los jugadores en el quiz
	for _, player in ipairs(players) do
		print("Jugador en el quiz: " .. player.Name)
		QuestionManager.showUI({ player }, true, 0)
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
		-- print(preguntaData.Pregunta)
		-- AGREGA
		setPreguntas:FireAllClients(preguntaData.Pregunta)
		setOpciones:FireAllClients(
			preguntaData.Opciones.A,
			preguntaData.Opciones.B,
			preguntaData.Opciones.C,
			preguntaData.Opciones.D
		)
		QuestionManager.getRespuestaJugador(preguntaData.Correcta, ScoreManager)
		QuestionManager.chronoPreguntas(players, tiempoJuego, 2)
		QuestionManager.boolPreguntas(players, true)
	end
	--terminamos el quizz
	if onFinish then
		onFinish()
		QuestionManager.showUI(players, false, 2)
	end
end

return QuestionManager
