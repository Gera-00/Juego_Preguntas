local GameManager = {}

GameManager.State = "LOBBY"

local LobbyManager = require(script.Parent.LobbyManager)
local ScoreManger = require(script.Parent.ScoreManager)
local QuestionManager = require(script.Parent.QuestionManager)

function GameManager.init()
	LobbyManager.init(GameManager)
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
	QuestionManager.initQuiz(20, 10, playersForGame, ScoreManger, function()
		GameManager.endGame()
	end)
end

function GameManager.endGame()
	print("[GameManager] Partida terminada")
	GameManager.State = "LOBBY"
	LobbyManager.reset()
end

return GameManager
