local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- RemoteEvent
local ShowWinnerEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("ShowWinner")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "WinnerUI"
gui.ResetOnSpawn = false
gui.Enabled = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- Fondo opcional (para que se vea más pro)
local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(1, 1)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.4
frame.Parent = gui

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(0.5, 0.12)
title.Position = UDim2.fromScale(0.25, 0.25)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Text = "🏆 GANADOR"
title.Parent = frame

-- Nombre del jugador
local playerLabel = Instance.new("TextLabel")
playerLabel.Size = UDim2.fromScale(0.4, 0.1)
playerLabel.Position = UDim2.fromScale(0.3, 0.4)
playerLabel.BackgroundTransparency = 0.2
playerLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
playerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerLabel.TextScaled = true
playerLabel.Font = Enum.Font.GothamBold
playerLabel.Text = ""
playerLabel.Parent = frame

-- Score
local scoreLabel = Instance.new("TextLabel")
scoreLabel.Size = UDim2.fromScale(0.3, 0.08)
scoreLabel.Position = UDim2.fromScale(0.35, 0.52)
scoreLabel.BackgroundTransparency = 0.2
scoreLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scoreLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
scoreLabel.TextScaled = true
scoreLabel.Font = Enum.Font.Gotham
scoreLabel.Text = ""
scoreLabel.Parent = frame

-- Evento
ShowWinnerEvent.OnClientEvent:Connect(function(name, score)
	gui.Enabled = true
	playerLabel.Text = name
	scoreLabel.Text = "Puntos: " .. score
	task.wait(6)
	gui.Enabled = false
end)
