local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local events = remotes:WaitForChild("Events")
local countdownEvent = events:WaitForChild("LobbyCountdown")

-----------------------------------------------------
-- GUI
-----------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "LobbyUI"
gui.ResetOnSpawn = false
gui.Enabled = false
gui.Parent = player:WaitForChild("PlayerGui")

-----------------------------------------------------
-- CONTADOR DE TIEMPO
-----------------------------------------------------
local countdownLabel = Instance.new("TextLabel")
countdownLabel.Name = "CountdownLabel"
countdownLabel.Size = UDim2.fromScale(0.4, 0.1)
countdownLabel.Position = UDim2.fromScale(0.3, 0.1)
countdownLabel.BackgroundTransparency = 0.3
countdownLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
countdownLabel.TextScaled = true
countdownLabel.Font = Enum.Font.GothamBold
countdownLabel.Text = ""
countdownLabel.Parent = gui

-----------------------------------------------------
-- CONTADOR DE JUGADORES
-----------------------------------------------------
local playersLabel = Instance.new("TextLabel")
playersLabel.Name = "PlayersLabel"
playersLabel.Size = UDim2.fromScale(0.25, 0.07)
playersLabel.Position = UDim2.fromScale(0.375, 0.22)
playersLabel.BackgroundTransparency = 0.3
playersLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
playersLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
playersLabel.TextScaled = true
playersLabel.Font = Enum.Font.Gotham
playersLabel.Text = ""
playersLabel.Parent = gui

-----------------------------------------------------
-- EVENTO
-----------------------------------------------------
countdownEvent.OnClientEvent:Connect(function(timeLeft, currentPlayers, maxPlayers)
	if timeLeft and timeLeft > 0 then
		gui.Enabled = true

		countdownLabel.Text = "La partida inicia en " .. timeLeft
		playersLabel.Text = "Jugadores: " .. currentPlayers .. " / " .. maxPlayers
	else
		gui.Enabled = false
	end
end)
