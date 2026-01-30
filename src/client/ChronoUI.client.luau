--@DEPRECATED
--[[
-- Jugador
local player = game:GetService("Players").LocalPlayer
-- Gui del jugador
local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("QuizGUI")
-- Frame y elementos de la interfaz que se utilizaran
local frame = playerGui:WaitForChild("Fr_tmp")
local tiempoLbl = frame:WaitForChild("Lb_tmp")

-- Evento para actualizar el tiempo en la UI
local updTiempo = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetTiempo")

-- Evento para actualizar el tiempo en la UI
-- evVisual es un parametro que se planea usar como un efecto visual dependiendo el tiempo que quede
-- este solamente hara que el tiempoLbl cambie de color, parpadee, etc @TODO
updTiempo.OnClientEvent:Connect(function(tiempoRestante, evVisual)
	tiempoLbl.Text = tostring(tiempoRestante)
end)
]]
