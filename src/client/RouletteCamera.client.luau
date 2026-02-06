local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local camera = workspace.CurrentCamera

local ShowThemeEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("ShowTheme")

local rouletteCamera = workspace:WaitForChild("Seleccion_Tema"):WaitForChild("RouletteCamera")
local roulette = workspace:WaitForChild("Seleccion_Tema"):WaitForChild("Roulette")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ThemeUI"
gui.ResetOnSpawn = false
gui.Enabled = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local fade = Instance.new("Frame")
fade.Size = UDim2.fromScale(1, 1)
fade.BackgroundColor3 = Color3.new(0, 0, 0)
fade.BackgroundTransparency = 1
fade.Parent = gui

local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.fromScale(0.8, 0.2)
themeLabel.Position = UDim2.fromScale(0.1, 0.4)
themeLabel.BackgroundTransparency = 1
themeLabel.TextScaled = true
themeLabel.Font = Enum.Font.GothamBlack
themeLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
themeLabel.TextStrokeTransparency = 0.2
themeLabel.TextStrokeColor3 = Color3.fromRGB(0, 180, 140)
themeLabel.TextTransparency = 1
themeLabel.Parent = gui

local fadeIn = TweenService:Create(fade, TweenInfo.new(0.5), { BackgroundTransparency = 0 })

local fadeOut = TweenService:Create(fade, TweenInfo.new(0.5), { BackgroundTransparency = 1 })

local textIn = TweenService:Create(themeLabel, TweenInfo.new(0.6, Enum.EasingStyle.Back), { TextTransparency = 0 })

local textOut = TweenService:Create(themeLabel, TweenInfo.new(0.4), { TextTransparency = 1 })

ShowThemeEvent.OnClientEvent:Connect(function(theme)
	print("[Cliente] Tema recibido:", theme)

	-- Activar cámara
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = rouletteCamera.CFrame

	-- Girar ruleta
	local spins = math.random(4, 7) * 360
	local tween = TweenService:Create(
		roulette,
		TweenInfo.new(4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{ Orientation = roulette.Orientation + Vector3.new(0, 0, spins) }
	)

	tween:Play()

	task.wait(2.5)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

	-- Mostrar tema en UI

	gui.Enabled = true
	themeLabel.Text = theme

	-- Fade a negro
	fadeIn:Play()
	fadeIn.Completed:Wait()

	-- Mostrar tema
	textIn:Play()
	textIn.Completed:Wait()

	task.wait(1.5)

	-- Ocultar tema
	textOut:Play()
	textOut.Completed:Wait()

	-- Regresar cámara
	camera.CameraType = Enum.CameraType.Custom

	-- Quitar fade
	fadeOut:Play()
	fadeOut.Completed:Wait()

	gui.Enabled = false
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)

	tween.Completed:Wait()
end)
