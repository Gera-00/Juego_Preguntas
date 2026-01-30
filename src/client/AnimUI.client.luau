-- Jugador
local player = game:GetService("Players").LocalPlayer
-- Gui del jugador
local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("QuizGUI")
-- Frames y elementos de la interfaz que se utilizaran
local frameOpc = playerGui:WaitForChild("Fr_opc")
local framePrg = playerGui:WaitForChild("Fr_prg")
local preguntaLbl = framePrg:WaitForChild("Lb_prg")
local puntajeLbl = playerGui:WaitForChild("Fr_pnt"):WaitForChild("Lb_pnt")
local frameChr = playerGui:WaitForChild("Fr_tmp")
local tiempoLbl = frameChr:WaitForChild("Lb_tmp")
-- Botones de opciones(A, B, C, D)
local op1Bt = frameOpc:WaitForChild("Op1")
local op2Bt = frameOpc:WaitForChild("Op2")
local op3Bt = frameOpc:WaitForChild("Op3")
local op4Bt = frameOpc:WaitForChild("Op4")
