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
local uiOpt = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetQuizUI")
-- Evento para actualizar las opciones en la UI
local boolPreg = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("BoolPreguntas")
-- Evento para actualizar la pregunta
local updPregunta = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetPregunta")
-- Evento para actualizar las opciones en la UI
local updOpciones = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetOpciones")
-- Evento para actualizar el tiempo en la UI
local updTiempo = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetTiempo")
-- Funcion para llamar al server
local checarResp = game:GetService("ReplicatedStorage").Remotes.Functions:WaitForChild("CheckResultado")

local errorSound = game:GetService("ReplicatedStorage").Assets.SFX["voice_message_driver_correction_hit_v2"]:Clone()
errorSound.Parent = playerGui
local correctSound = game:GetService("ReplicatedStorage").Assets.SFX["Correct!"]:Clone()
correctSound.Parent = playerGui
local universalTimer = 0
local clicks = 0

-- funcion para que el jugador no le de varias veces al mismo boton, detectandolo mediante las veces que dio click, no debe pasarse de 1
local function clicksPerBt()
	if clicks > 1 then
		op1Bt.Interactable = false
		op2Bt.Interactable = false
		op3Bt.Interactable = false
		op4Bt.Interactable = false
		clicks = 0
	end
end

-- Mostrar/Limpiar/Esconder UI dependiendo lo que pida el servidor
uiOpt.OnClientEvent:Connect(function(mostrar)
	if mostrar then
		playerGui.Enabled = mostrar
	else
		preguntaLbl.Text = "¿?"
		op1Bt.Text = "A"
		op2Bt.Text = "B"
		op3Bt.Text = "C"
		op4Bt.Text = "D"
		puntajeLbl.Text = "0"
		tiempoLbl.Text = "0"
		playerGui.Enabled = false
	end
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
updTiempo.OnClientEvent:Connect(function(tiempoRestante)
	universalTimer = tiempoRestante
	tiempoLbl.Text = tostring(tiempoRestante)
end)

--- Opcion A, llama a la funcion del server para checar la respuesta
op1Bt.MouseButton1Click:Connect(function()
	clicks += 1
	local puntaje = checarResp:InvokeServer("A", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	if puntaje == 0 then
		errorSound:Play()
	else
		correctSound:Play()
	end
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	-- print(universalTimer)
	clicksPerBt()
end)

-- Opcion B, llama a la funcion del server para checar la respuesta
op2Bt.MouseButton1Click:Connect(function()
	clicks += 1
	local puntaje = checarResp:InvokeServer("B", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	if puntaje == 0 then
		errorSound:Play()
	else
		correctSound:Play()
	end
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	-- print(universalTimer)
	clicksPerBt()
end)

-- Opcion C, llama a la funcion del server para checar la respuesta
op3Bt.MouseButton1Click:Connect(function()
	clicks += 1
	local puntaje = checarResp:InvokeServer("C", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	if puntaje == 0 then
		errorSound:Play()
	else
		correctSound:Play()
	end
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	-- print(universalTimer)
	clicksPerBt()
end)

-- Opcion D, llama a la funcion del server para checar la respuesta
op4Bt.MouseButton1Click:Connect(function()
	clicks += 1
	local puntaje = checarResp:InvokeServer("D", universalTimer)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	if puntaje == 0 then
		errorSound:Play()
	else
		correctSound:Play()
	end
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
	-- print(universalTimer)
	clicksPerBt()
end)
