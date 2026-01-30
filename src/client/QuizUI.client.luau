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

-- Evento para mostrar/esconder la UI
local uiOpt = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("ToggleUI")
-- Evento para actualizar las opciones en la UI
local boolPreg = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("BoolPreguntas")
-- Evento para actualizar la pregunta
local updPregunta = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetPregunta")
-- Evento para actualizar las opciones en la UI
local updOpciones = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetOpciones")
-- Evento para actualizar el tiempo en la UI
local updTiempo = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetTiempo")
-- Funcion para llamar al server
local checarResp = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions").CheckResultado

local universalTimer = 0

-- Mostrar/Esconder UI dependiendo la peticion del server
uiOpt.OnClientEvent:Connect(function(mostrar)
	playerGui.Enabled = mostrar
end)

-- Activar/Desactivar botones de opciones
boolPreg.OnClientEvent:Connect(function(turnBtns)
	op1Bt.Interactable = turnBtns
	op2Bt.Interactable = turnBtns
	op3Bt.Interactable = turnBtns
	op4Bt.Interactable = turnBtns
end)

-- Evento para actualizar la pregunta en la UI
updPregunta.OnClientEvent:Connect(function(preguntaText)
	preguntaLbl.Text = preguntaText
end)

-- Evento para actualizar las opciones en la UI
updOpciones.OnClientEvent:Connect(function(opcionA, opcionB, opcionC, opcionD)
	op1Bt.Text = opcionA
	op2Bt.Text = opcionB
	op3Bt.Text = opcionC
	op4Bt.Text = opcionD
end)

-- Evento para actualizar el tiempo en la UI
-- evVisual es un parametro que se planea usar como un efecto visual dependiendo el tiempo que quede
-- este solamente hara que el tiempoLbl cambie de color, parpadee, etc @TODO
updTiempo.OnClientEvent:Connect(function(tiempoRestante, evVisual)
	universalTimer = tiempoRestante
	tiempoLbl.Text = tostring(tiempoRestante)
end)

--- Opcion A, llama a la funcion del server para checar la respuesta
op1Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("A", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	print(universalTimer)
end)

-- Opcion B, llama a la funcion del server para checar la respuesta
op2Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("B", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	print(universalTimer)
end)

-- Opcion C, llama a la funcion del server para checar la respuesta
op3Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("C", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	print(universalTimer)
end)

-- Opcion D, llama a la funcion del server para checar la respuesta
op4Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("D", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	print(universalTimer)
end)
