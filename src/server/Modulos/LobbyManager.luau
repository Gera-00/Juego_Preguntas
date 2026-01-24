local LobbyManager = {}

--Servicos
local Players = game:GetService("Players")

--Referencias del mapa
local lobbyFolder = workspace:WaitForChild("Lobby_Escenario")
local startZone = lobbyFolder:WaitForChild("StartGameZone")

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
function LobbyManager.init()
	startZone.Touched:Connect(function(hit)
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

	--Detectar cuando un jugador se va
	Players.PlayerRemoving:Connect(function(player)
		LobbyManager.unregisterPlayer(player)
	end)

	--Monitorear jugadores dentro de la zona
	task.spawn(function()
		while true do
			for player, _ in pairs(registeredPlayers) do
				if not LobbyManager.isPlayerInZone(player) then
					LobbyManager.unregisterPlayer(player)
				end
			end
			task.wait(0.5) -- frecuensia de revisión
		end
	end)

	print("[LobbyManager] Inicializado correctamente")
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
---- TELEPORT
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
		LobbyManager.startGame()
	end)
end

-----------------------------------------------------
---- START GAME
-----------------------------------------------------
function LobbyManager.startGame()
	print("[LobbyManager] PARTIDA INICIADA")

	for player, _ in pairs(registeredPlayers) do
		LobbyManager.teleportPlayer(player)
	end

	-- Reset lobby si quieres reutilizarlo
	registeredPlayers = {}
	playerCount = 0
	countdownRunning = false
end

return LobbyManager
