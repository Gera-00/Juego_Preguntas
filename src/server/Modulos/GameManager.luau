local GameManager = {}

GameManager.State = "LOBBY"

local LobbyManager = require(script.Parent.LobbyManager)
local ScoreManger = require(script.Parent.ScoreManager)
local QuestionManager = require(script.Parent.QuestionManager)
local WinnerManager = require(script.Parent.WinnerManager)

-- Configura las colisiones entre jugadores
function GameManager.PlayerCollisions(isCollision)
	local physicsService = game:GetService("PhysicsService")
	physicsService:RegisterCollisionGroup("p")
	physicsService:CollisionGroupSetCollidable("p", "p", false)

	local function setCollisionGroup(model, groupName)
		for _, part in pairs(model:GetChildren()) do
			if part:IsA("BasePart") then
				part.CollisionGroup = groupName
			end
		end
	end

	if not isCollision then
		game:GetService("Players").PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function(char)
				task.wait(0.1)
				setCollisionGroup(char, "p")
			end)
		end)
	else
		warn("[GameManager] Error de colisiones de jugadores")
	end
end

-- Deshabilita la interfaz de quiz para los jugadores que se unan
function GameManager.deshabilitarInterfaz(bool)
	if bool then
		game:GetService("Players").PlayerAdded:Connect(function(player)
			local uiOpt = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetQuizUI")
			local changeUI = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("QuizChange")
			changeUI:FireClient(player, false, false)
			uiOpt:FireClient(player, false)
		end)
	end
end

-- Añadir atributos al jugador
function GameManager.addPlayerAttributes()
	game:GetService("Players").PlayerAdded:Connect(function(player)
		player:SetAttribute("atrilAsignado", 0) -- NO BORRAR ATRIBUTO
		player.CameraMaxZoomDistance = 10
		player.CameraMinZoomDistance = 5
	end)
end

function GameManager.init()
	GameManager.deshabilitarInterfaz(true)
	GameManager.addPlayerAttributes()
	GameManager.PlayerCollisions(false) -- Deshabilitas/Habilitas las colisiones entre jugadores
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
	LobbyManager.teleportPlayer(playersForGame)

	------------------------------------------------------------
	--- SE INICIALIZAN MODULOS DE SCORE Y QUESTION
	------------------------------------------------------------
	ScoreManger.init(playersForGame)

	-- Datos por default: 21 segundos por pregunta, 10 preguntas por jugador
	QuestionManager.initQuiz(21, 10, playersForGame, ScoreManger, function()
		GameManager.endGame(playersForGame)
	end)
end

function GameManager.endGame(playersForGame)
	print("[GameManager] Partida terminada")

	local winner, score = ScoreManger.getWinner()

	--Mostrar ganador
	WinnerManager.showWinner(winner, score, playersForGame)

	task.wait(6)

	-- Volver al Lobby
	LobbyManager.teleportToLobby(playersForGame)
	GameManager.State = "LOBBY"
	LobbyManager.enable()
end

return GameManager
