local GameManager = {}

GameManager.State = "LOBBY"

local LobbyManager = require(script.Parent.LobbyManager)
local ScoreManger = require(script.Parent.ScoreManager)
local QuestionManager = require(script.Parent.QuestionManager)

function GameManager.init()
	LobbyManager.init(GameManager)
	LobbyManager.enable()
end

function GameManager.startGame(players)
	if GameManager.State ~= "LOBBY" then
		return
	end

	local playersForGame = {}

	--Clonamos la lista de jugadores
	for player, _ in pairs(players) do
		table.insert(playersForGame, player)
	end

	GameManager.State = "QUIZ"
	LobbyManager.disable()
	print("[GameManager] Iniciando partida")

	--TELEPORT DE JUGADORES
	for _, player in ipairs(playersForGame) do
		LobbyManager.teleportPlayer(player)
	end

	------------------------------------------------------------
	--- SE INICIALIZAN MODULOS DE SCORE Y QUESTION
	------------------------------------------------------------
	ScoreManger.init(playersForGame)

	task.wait(3)
	-- Datos por default: 20 segundos por pregunta, 10 preguntas por jugador
	QuestionManager.initQuiz(20, 5, playersForGame, ScoreManger, function()
		GameManager.endGame(playersForGame)
	end)
end

function GameManager.endGame(playersForGame)
	print("[GameManager] Partida terminada")

	--Teleport de regreso al lobby
	LobbyManager.teleportToLobby(playersForGame)

	GameManager.State = "LOBBY"
	LobbyManager.enable()
end

return GameManager
