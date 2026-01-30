local LobbyManager = {}

LobbyManager.active = false
local gameManager = nil -- referencia externa de modulo GameManager

--Servicos
local Players = game:GetService("Players")

--Referencias del mapa
local lobbyFolder = workspace:WaitForChild("Lobby_Escenario")
local startZone = lobbyFolder:WaitForChild("StartGameZone")
local lobbySpawn = lobbyFolder:WaitForChild("SpawnLocation")

local partidaFolder = workspace:WaitForChild("Partida_Escenario")
local gameSpawn = partidaFolder:WaitForChild("SpawnGameZone")

--Estado del lobby
local registeredPlayers = {}
local playerCount = 0

--Configuración
local MIN_PLAYERS = 1
local COUNTDOWN_TIME = 10

--Control de COUNTDOWN
local countdownRunning = false

-----------------------------------------------------
---- INIT
-----------------------------------------------------
function LobbyManager.init(manager)
	gameManager = manager

	startZone.Touched:Connect(function(hit)
		if not LobbyManager.active then
			return
		end

		local character = hit.Parent
		local humanoid = character:FindFirstChild("Humanoid")
		if not humanoid then
			return
		end

		local player = Players:GetPlayerFromCharacter(character)
		if not player then
			return
		end

		LobbyManager.registerPlayer(player)
	end)

	Players.PlayerRemoving:Connect(function(player)
		LobbyManager.unregisterPlayer(player)
	end)

	task.spawn(function()
		while true do
			if LobbyManager.active then
				for player, _ in pairs(registeredPlayers) do
					if not LobbyManager.isPlayerInZone(player) then
						LobbyManager.unregisterPlayer(player)
					end
				end
			end
			task.wait(0.5)
		end
	end)

	print("[LobbyManager] MODULO Inicializado correctamente")
end

--funciones

-----------------------------------------------------
---- DETECTAR JUGADOR EN ZONA DE INICIO
-----------------------------------------------------
function LobbyManager.isPlayerInZone(player)
	if not player.Character then
		return false
	end

	local hrp = player.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return false
	end

	local zoneCF = startZone.CFrame
	local zoneSize = startZone.Size

	local relativePosition = zoneCF:PointToObjectSpace(hrp.Position)

	return math.abs(relativePosition.X) <= zoneSize.X / 2 and math.abs(relativePosition.Z) <= zoneSize.Z / 2
end
-----------------------------------------------------
---- REGISTRAR JUGADOR
-----------------------------------------------------
function LobbyManager.registerPlayer(player)
	-- Evitar duplicados
	if registeredPlayers[player] then
		return
	end

	registeredPlayers[player] = true
	playerCount += 1

	print("[LobbyManager] Jugador registrado:", player.Name)
	print("[LobbyManager] Jugador actuales:", playerCount)

	-- Teletransportar al jugador
	--LobbyManager.teleportPlayer(player)

	--Iniciar countdown si hay al menos un jugador
	if playerCount >= MIN_PLAYERS then
		LobbyManager.startCountdown()
	end
end

-----------------------------------------------------
---- BORRAR JUGADOR
-----------------------------------------------------
function LobbyManager.unregisterPlayer(player)
	-- Evitar duplicados
	if not registeredPlayers[player] then
		return
	end

	registeredPlayers[player] = nil
	playerCount -= 1

	print("[LobbyManager] Jugador salió:", player.Name)
	print("[LobbyManager] Jugador actuales:", playerCount)

	--Cancelar countdown si ya no hay jugadores
	if playerCount < MIN_PLAYERS then
		countdownRunning = false
		print("[LobbyManager] Cuenta regresiva cancelada")
	end
end

-----------------------------------------------------
---- TELEPORTS
-----------------------------------------------------
--funcion para teletransporta jugador
function LobbyManager.teleportPlayer(player)
	if not player.Character then
		player.CharacterAdded:Wait()
	end

	local character = player.Character
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	humanoidRootPart.CFrame = gameSpawn.CFrame + Vector3.new(0, 3, 0)
	print("[LobbyManager] Teletransportado:", player.Name)
end

function LobbyManager.teleportToLobby(players)
	for _, player in ipairs(players) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = lobbySpawn.CFrame + Vector3.new(0, 3, 0)

			print("[LobbyManager] Regresado al lobby:", player.Name)
		end
	end
end

-----------------------------------------------------
---- COUNTDOWN
-----------------------------------------------------
function LobbyManager.startCountdown()
	if countdownRunning then
		return
	end

	countdownRunning = true
	print("[LobbyManager] Cuenta regresiva iniciada")

	task.spawn(function()
		for i = COUNTDOWN_TIME, 1, -1 do
			-- Si se queda sin jugadores, se cancela
			if not countdownRunning or playerCount < MIN_PLAYERS then
				return
			end

			print("La partida inicia en:", i)
			task.wait(1)
		end
		--Iniciar partida
		countdownRunning = false
		LobbyManager.active = false

		gameManager.startGame(registeredPlayers)
	end)
end

-----------------------------------------------------
---- ACTIVAR Y DESACTIVAR LOBBY
-----------------------------------------------------
function LobbyManager.enable()
	LobbyManager.active = true
	print("[LobbyManager] Lobby ACTIVADO")
end

function LobbyManager.disable()
	LobbyManager.active = false
	LobbyManager.reset()
	print("[LobbyManager] Lobby DESACTIVADO")
end

-----------------------------------------------------
---- RESET
-----------------------------------------------------
function LobbyManager.reset()
	print("[LobbyManager] Reset del lobby")

	registeredPlayers = {}
	playerCount = 0
	countdownRunning = false
end

return LobbyManager
