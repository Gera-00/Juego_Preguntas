local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local SoundEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("SoundEvent")

local soundsFolder = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Provisional")

-- Cargar sonidos
local lobbyMusic = soundsFolder:WaitForChild("LobbyMusic")
local currentSound = nil
local isLobbyMusicPlaying = false

-- Función para verificar si la música del lobby ya está sonando
local function isLobbyMusicActive()
	return isLobbyMusicPlaying and currentSound ~= nil
end

-- Función para crear y configurar el sonido del lobby
local function createLobbySound()
	-- Si ya hay música sonando, no hacer nada
	if isLobbyMusicActive() then
		print("[SoundManager] La música del lobby ya está sonando, omitiendo...")
		return currentSound
	end

	-- Detener y limpiar sonido anterior si existe
	if currentSound then
		currentSound:Stop()
		currentSound:Destroy()
	end

	currentSound = lobbyMusic:Clone()
	currentSound.Parent = SoundService
	currentSound.Looped = true
	currentSound.Volume = 0
	currentSound.Name = "LobbyMusic_Active"

	isLobbyMusicPlaying = true
	print("[SoundManager] Nueva instancia de música del lobby creada")
	return currentSound
end

--------------------------------------------------
-- UTILIDADES
--------------------------------------------------
local function fadeIn(sound, volume, time)
	isLobbyMusicPlaying = true
	sound:Play()
	TweenService:Create(sound, TweenInfo.new(time or 1), { Volume = volume }):Play()
end

local function fadeOut(sound, time)
	isLobbyMusicPlaying = false
	TweenService:Create(sound, TweenInfo.new(time or 1), { Volume = 0 }):Play()
	task.delay(time or 1, function()
		if sound then
			sound:Stop()
		end
	end)
end

local function stopAll()
	if currentSound then
		currentSound:Stop()
		currentSound.Volume = 0
		isLobbyMusicPlaying = false
		print("[SoundManager] Música del lobby detenida")
	end
end

-- Función para detener específicamente la música del lobby
local function stopLobbyMusic()
	if currentSound then
		fadeOut(currentSound, 1)
		task.delay(1, function()
			if currentSound then
				currentSound:Destroy()
				currentSound = nil
			end
			print("[SoundManager] Música del lobby detenida")
		end)
	end
end

--------------------------------------------------
-- EVENTOS
--------------------------------------------------
SoundEvent.OnClientEvent:Connect(function(action)
	print("[SoundManager] Acción:", action)

	if action == "LOBBY_START" then
		local lobbySound = createLobbySound()
		if lobbySound then
			fadeIn(lobbySound, 0.6, 1.5)
			print("[SoundManager] Música del lobby iniciada con fade-in")
		end
	elseif action == "LOBBY_STOP" or action == "GAME_START" then
		stopLobbyMusic()
	end
end)

-- Limpiar cuando el jugador sale del juego
local Players = game:GetService("Players")
local player = Players.LocalPlayer

player.CharacterRemoving:Connect(function()
	stopAll()
end)
