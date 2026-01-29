-- Jugador
local player = game:GetService("Players").LocalPlayer
-- Gui del jugador
local playerGui = player.PlayerGui:WaitForChild("QuizGUI")
-- Frame y elementos de la interfaz que se utilizaran
local frame = playerGui:WaitForChild("Fr_prg")
local preguntaLbl = frame:WaitForChild("Lb_prg")

-- Evento para actualizar la pregunta
local updPregunta = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetPregunta")

-- Evento para actualizar la pregunta en la UI
updPregunta.OnClientEvent:Connect(function(preguntaText)
	preguntaLbl.Text = preguntaText
end)
