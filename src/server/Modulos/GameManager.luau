--- Modulo encargado del manejo de funciones principales del juego
local GameManager = {
	["Data"] = require(game:GetService("ServerScriptService").Server.Modulos.GameData),
}

GameManager.ruletaTemas = function()
	-- 
	local temasDisponibles = {}
	for nombreTema, _ in pairs(GameManager.Data.Preguntas) do
		table.insert(temasDisponibles, nombreTema)
	end

	-- 
	if #temasDisponibles == 0 then
		warn("ruletaTemas: no hay temas disponibles")
		return nil
	end

	-- 
	local numRand = Random.new()
	local indiceAleatorio = numRand:NextInteger(1, #temasDisponibles)
	local temaSeleccionado = temasDisponibles[indiceAleatorio]

	print("Tema seleccionado por la ruleta: " .. temaSeleccionado)
	return temaSeleccionado
end

GameManager.getRespuestaJugador = function(respuestaActual)
	-- Implementacion de la logica para obtener la respuesta del jugador
	local verResp = game:GetService("ReplicatedStorage")
		:WaitForChild("Remotes")
		:WaitForChild("Functions")
		:WaitForChild("CheckResult")
	verResp.OnServerInvoke = function(player, respuesta, tiempoResp)
		local calcPunt = 100 + (tiempoResp * 5) -- @TODO esto se debe cambiar despues
		if respuestaActual == respuesta then
			print("Respuesta correcta del jugador: " .. player.Name)
			return calcPunt
		else
			print("Respuesta incorrecta del jugador: " .. player.Name)
			return 0
		end
	end
end

GameManager.setPoolPreguntas = function(tema, cantidadPreguntas)
	-- Obtiene todas las preguntas del tema (todas las dificultades), las mezcla y devuelve 'cantidadPreguntas'
	local temaTabla = GameManager.Data.Preguntas[tema]
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

GameManager.iniciarJuego = function() end

return GameManager
