-- Jugador
local player = game:GetService("Players").LocalPlayer
-- Gui del jugador
local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("QuizGUI")
-- Frame y elementos de la interfaz que se utilizaran
local frame = playerGui:WaitForChild("Fr_opc")
local puntajeLbl = playerGui:WaitForChild("Fr_pnt"):WaitForChild("Lb_pnt")
-- Botones de opciones(A, B, C, D)
local op1Bt = frame:WaitForChild("Op1")
local op2Bt = frame:WaitForChild("Op2")
local op3Bt = frame:WaitForChild("Op3")
local op4Bt = frame:WaitForChild("Op4")

-- Funcion para llamar al server
local checarResp = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions").CheckResultado
-- Evento para actualizar las opciones en la UI
local updOpciones = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("SetOpciones")

updOpciones.OnClientEvent:Connect(function(opcionA, opcionB, opcionC, opcionD)
	op1Bt.Text = opcionA
	op2Bt.Text = opcionB
	op3Bt.Text = opcionC
	op4Bt.Text = opcionD
end)

-- Eventos de los botones de opciones

--- Opcion A, llama a la funcion del server para checar la respuesta
op1Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("A", 5)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
end)

-- Opcion B, llama a la funcion del server para checar la respuesta
op2Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("B", 10)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
end)

-- Opcion C, llama a la funcion del server para checar la respuesta
op3Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("C", 15)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
end)

-- Opcion D, llama a la funcion del server para checar la respuesta
op4Bt.MouseButton1Click:Connect(function()
	local puntaje = checarResp:InvokeServer("D", 20)
	local puntajeAnterior = tonumber(string.match(puntajeLbl.Text, "%d+")) or 0
	puntajeLbl.Text = tostring(puntajeAnterior + puntaje)
end)
