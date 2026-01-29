local GameManager = {}

GameManager.State = "LOBBY"

local LobbyManager = require(script.Parent.LobbyManager)
local QuestionManager = require(script.Parent.QuestionManager)

function GameManager.init()
	LobbyManager.init(GameManager)
end

function GameManager.startGame(players)
	if GameManager.State ~= "LOBBY" then
		return
	end

	GameManager.State = "QUIZ"
	print("[GameManager] Iniciando partida")

	--TELEPORT DE JUGADORES
	for player, _ in pairs(players) do
		LobbyManager.teleportPlayer(player)
	end

	------------------------------------------------------------
	--- YA INICIA LA PARTIDA, SOLO HAY QUE MODIFICAR EL INIT QUIZ
	---	PARA QUE RECIBA EL ARRAY DE JUGADORES
	------------------------------------------------------------
	task.wait(3)
	QuestionManager.initQuiz(20, 10, players)
end

function GameManager.endGame()
	print("[GameManager] Partida terminada")
	GameManager.State = "LOBBY"
	LobbyManager.reset()
end

return GameManager
