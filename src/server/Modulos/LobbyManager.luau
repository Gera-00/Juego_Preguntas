local LobbyManager = {}

LobbyManager.active = false
local gameManager = nil -- referencia externa de modulo GameManager

--Servicos
local Players = game:GetService("Players")

--Referencias del mapa
local lobbyFolder = workspace:WaitForChild("Lobby_Escenario")
local startZone = lobbyFolder:WaitForChild("StartGameZone")
local lobbySpawn = lobbyFolder:WaitForChild("SpawnLocation")
local wallsFolder = lobbyFolder:WaitForChild("LobbyWalls")

local partidaFolder = workspace:WaitForChild("Partida_Escenario")
local gameSpawn = partidaFolder:WaitForChild("SpawnGameZone")

--Estado del lobby
local registeredPlayers = {}
local playerCount = 0

--Configuración
local MIN_PLAYERS = 1
local MAX_PLAYERS = 6
local COUNTDOWN_TIME = 10
local touchDebounce = {} -- para evitar múltiples toques rápidos

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

	-- Si el lobby está lleno se bloquea las StarZone y no aplica deobounce
	if playerCount >= MAX_PLAYERS then
		print("[LobbyManager] Límite de jugadores alcanzado]")
		return
	end

	--Debounce para evitar múltiples toques rápidos
	if touchDebounce[player] then
		return
	end
	touchDebounce[player] = true

	registeredPlayers[player] = true
	playerCount += 1

	LobbyManager.snapPlayerToZone(player)

	if playerCount == MAX_PLAYERS then
		LobbyManager.lockStartZone()
	end

	print("[LobbyManager] Jugador registrado:", player.Name)
	print("[LobbyManager] Jugador actuales:", playerCount)

	--Iniciar countdown si hay al menos un jugador
	if playerCount >= MIN_PLAYERS then
		LobbyManager.startCountdown()
	end

	task.delay(0.5, function()
		touchDebounce[player] = nil
	end)
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

		if LobbyManager.active then
			LobbyManager.unlockStartZone()
		end

		print("[LobbyManager] Cuenta regresiva cancelada")
	end
end

-----------------------------------------------------
---- TELEPORTS
-----------------------------------------------------
--funcion para teletransporta jugador
function LobbyManager.teleportPlayer(players)
	local spawns = partidaFolder:GetChildren()

	for index, player in ipairs(players) do
		local spawn = spawns[index]

		if not spawn then
			warn("No hay spawn para el jugador", player.Name)
			continue
		end

		if not player.Character then
			player.CharacterAdded:Wait()
		end

		-- Asignar atributo del atril al que pertenece el jugador, añadido por @ZyoN31
		player:SetAttribute("atrilAsignado", index)
		print("[LobbyManager] Atril asignado a jugador:", player.Name, "Atril Nº", index)

		local character = player.Character
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

		humanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)

		print("[LobbyManager] Teletransportado:", player.Name, "al spawn", index)
	end
end

function LobbyManager.teleportToLobby(players)
	for _, player in ipairs(players) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = lobbySpawn.CFrame + Vector3.new(0, 3, 0)

			--regresamos movimiento
			player:SetAttribute("atrilAsignado", 0) -- reset atril asignado, añadido por @ZyoN31
			local humanoid = player.Character:FindFirstChild("Humanoid")
			humanoid.WalkSpeed = 16
			humanoid.JumpPower = 50.145
			humanoid.JumpHeight = 7.2

			print("[LobbyManager] Regresado al lobby:", player.Name)
		end
	end
end

function LobbyManager.snapPlayerToZone(player)
	if not player.Character then
		return
	end

	local hrp = player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid = player.Character:FindFirstChild("Humanoid")
	if not hrp or not humanoid then
		return
	end

	-- Teleport suave al centro de la StartZone
	hrp.CFrame = startZone.CFrame + Vector3.new(0, 3, 0)

	-- Opcional: bloquear movimiento para evitar empujones
	humanoid.WalkSpeed = 0
	humanoid.JumpPower = 0
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
			-- Accedemos al evento para mostrar Cuenta en Pantalla
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local remotes = ReplicatedStorage:WaitForChild("Remotes")
			local events = remotes:WaitForChild("Events")
			local countdownEvent = events:WaitForChild("LobbyCountdown")

			-- Si se queda sin jugadores, se cancela
			if not countdownRunning or playerCount < MIN_PLAYERS then
				countdownEvent:FireAllClients(0, playerCount, MAX_PLAYERS)
				return
			end

			print("La partida inicia en:", i)
			countdownEvent:FireAllClients(i, playerCount, MAX_PLAYERS)

			task.wait(1)
			if i == 1 then
				countdownEvent:FireAllClients(0, playerCount, MAX_PLAYERS)
			end
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
	-- Accedemos al evento para mostrar Cuenta en Pantalla
	local ReplicatedStorage = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Events")
	local SoundEvent = ReplicatedStorage:WaitForChild("SoundEvent")

	LobbyManager.active = true
	LobbyManager.unlockStartZone()

	SoundEvent:FireAllClients("LOBBY_START")

	print("[LobbyManager] Lobby ACTIVADO")
end

function LobbyManager.disable()
	-- Enviar evento para detener la música del lobby
	local ReplicatedStorage = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Events")
	local SoundEvent = ReplicatedStorage:WaitForChild("SoundEvent")
	SoundEvent:FireAllClients("LOBBY_STOP")

	LobbyManager.lockStartZone()
	LobbyManager.active = false
	LobbyManager.reset()
	print("[LobbyManager] Lobby DESACTIVADO")
end

-----------------------------------------------------
---- BLOQUEAR Y DESBLOQUEAR STARTZONE
-----------------------------------------------------
function LobbyManager.lockStartZone()
	for _, wall in ipairs(wallsFolder:GetChildren()) do
		wall.Transparency = 0.3
		wall.CanCollide = true
	end
end

function LobbyManager.unlockStartZone()
	for _, wall in ipairs(wallsFolder:GetChildren()) do
		wall.Transparency = 1
		wall.CanCollide = false
	end
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
