-- Jugador
local player = game:GetService("Players").LocalPlayer
-- Gui del jugador
local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("QuizGUI")
-- Frames y elementos de la interfaz que se utilizaran
local frameOpc = playerGui:WaitForChild("Fr_opc")
local framePrg = playerGui:WaitForChild("Fr_prg")
-- local preguntaLbl = framePrg:WaitForChild("Lb_prg")
local puntajeLbl = playerGui:WaitForChild("Fr_pnt"):WaitForChild("Lb_pnt")
local frameChr = playerGui:WaitForChild("Fr_tmp")
local tiempoLbl = frameChr:WaitForChild("Lb_tmp")
-- Botones de opciones(A, B, C, D)
local op1Bt = frameOpc:WaitForChild("Op1")
local op2Bt = frameOpc:WaitForChild("Op2")
local op3Bt = frameOpc:WaitForChild("Op3")
local op4Bt = frameOpc:WaitForChild("Op4")

-- Evento para mostrar/esconder la UI al momento de responder o salir una nueva pregunta
local changeUI = game:GetService("ReplicatedStorage").Remotes.Events:WaitForChild("QuizChange")

-- Servicios de Tween
local TweenService = game:GetService("TweenService")

-- Funcion para aplicar efectos dinamicos a los botones
local function DoTweenButtons(Button)
	-- Configuraciones de Tween para los efectos dinamicos
	local ButtonsEffect = TweenInfo.new(
		0.2, -- Tiempo
		Enum.EasingStyle.Exponential, -- Estilo
		Enum.EasingDirection.InOut, -- Direccion
		0, -- Repeticiones
		false, -- Reverso
		0 -- Retraso
	)

	local clickEffect = TweenInfo.new(
		0.1, -- Tiempo
		Enum.EasingStyle.Cubic, -- Estilo
		Enum.EasingDirection.InOut, -- Direccion
		0, -- Repeticiones
		false, -- Reverso
		0 -- Retraso
	)
	-- Valores originales y nuevos para los botones
	local clickBt = {
		BackgroundColor3 = Color3.fromRGB(225, 103, 255),
		TextColor3 = Color3.fromRGB(255, 255, 255),
	}
	local originalBt = {
		BackgroundColor3 = Button.BackgroundColor3,
		TextColor3 = Button.TextColor3,
	}
	local newBt = {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		TextColor3 = Color3.fromRGB(55, 255, 0),
	}
	local originalStroke = {
		Transparency = Button.UIStroke.Transparency,
		Color = Button.UIStroke.Color,
	}
	local newStroke = {
		Transparency = 0,
		Color = Color3.fromRGB(114, 114, 114),
	}

	-- Tweens para los efectos de hover y leave
	local clickTween = TweenService:Create(Button, clickEffect, clickBt)
	local onHoverBt = TweenService:Create(Button, ButtonsEffect, newBt)
	local onLeaveBt = TweenService:Create(Button, ButtonsEffect, originalBt)
	local onHoverBtStroke = TweenService:Create(Button.UIStroke, ButtonsEffect, newStroke)
	local onLeaveBtStroke = TweenService:Create(Button.UIStroke, ButtonsEffect, originalStroke)

	-- Conexiones de eventos para los efectos
	Button.MouseEnter:Connect(function()
		onHoverBt:Play()
		onHoverBtStroke:Play()
	end)
	Button.MouseLeave:Connect(function()
		onLeaveBt:Play()
		onLeaveBtStroke:Play()
	end)

	Button.MouseButton1Click:Connect(function()
		-- clonar sonido del replicated storage para evitar conflictos entre botones
		local clickSound = game:GetService("ReplicatedStorage").Assets.SFX.clicksound:Clone()
		clickSound.Parent = playerGui
		clickSound:Play()
		clickTween:Play()
		clickTween.Completed:Wait()
		-- Volver al estado original después del clic (2 segundos)
		task.wait(2)
		onLeaveBt:Play()
		onLeaveBtStroke:Play()
	end)
end

-- Funcion para la animacion de Cronometro
function DoTweenChrono(Chrono)
	-- Configuraciones de Tween para el cronometro
	local ChronoEffect = TweenInfo.new(
		1.5, -- Tiempo
		Enum.EasingStyle.Exponential, -- Estilo
		Enum.EasingDirection.InOut, -- Direccion
		0, -- Repeticiones
		false, -- Reverso
		0 -- Retraso
	)

	-- Valores para Chrono
	-- De 20 a 12 segundos
	local chronoPhase1 = {
		BackgroundColor3 = Color3.fromRGB(0, 255, 0),
	}
	-- De 11 a 6 segundos
	local chronoPhase2 = {
		BackgroundColor3 = Color3.fromRGB(255, 221, 0),
	}
	-- De 5 a 0 segundos
	local chronoPhase3 = {
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
	}

	-- Tweens para los efectos del cronometro
	local chronoTween1 = TweenService:Create(Chrono.Parent, ChronoEffect, chronoPhase1)
	local chronoTween2 = TweenService:Create(Chrono.Parent, ChronoEffect, chronoPhase2)
	local chronoTween3 = TweenService:Create(Chrono.Parent, ChronoEffect, chronoPhase3)

	-- Conexiones de eventos para los efectos del cronometro
	Chrono:GetPropertyChangedSignal("Text"):Connect(function()
		local timeLeft = tonumber(Chrono.Text)
		if timeLeft then
			if timeLeft == 12 then
				chronoTween2:Play()
			elseif timeLeft == 5 then
				chronoTween3:Play()
			elseif timeLeft == 0 then
				chronoTween1:Play()
			end
		end
	end)
end

-- Funcion para esconder/mostrar la interfaz cuando se responde o sale una nueva pregunta
function DoTweenFramesQuiz(FramePnt, FrameChr, FramePrg, FrameOpt)
	local fadeEffect = TweenInfo.new(
		1.35, -- Tiempo
		Enum.EasingStyle.Circular, -- Estilo
		Enum.EasingDirection.InOut, -- Direccion
		0, -- Repeticiones
		false, -- Reverso
		0 -- Retraso
	)

	-- Valores para los frames
	-- FramePnt
	local showPuntaje = {
		Position = FramePnt.Position,
	}
	local hidePuntaje = {
		Position = UDim2.new(FramePnt.Position.X.Scale, FramePnt.Position.X.Offset, -0.5, FramePnt.Position.Y.Offset),
	}
	-- FrameChr
	local fadeInChr = {
		Position = FrameChr.Position,
	}
	local fadeOutChr = {
		Position = UDim2.new(FrameChr.Position.X.Scale, FrameChr.Position.X.Offset, 1.5, FrameChr.Position.Y.Offset),
	}
	-- FramePrg
	local fadeInPrg = {
		Position = FramePrg.Position,
	}
	local fadeOutPrg = {
		Position = UDim2.new(FramePrg.Position.X.Scale, FramePrg.Position.X.Offset, 1.5, FramePrg.Position.Y.Offset),
	}
	-- FrameOpt
	local fadeInOpt = {
		Position = FrameOpt.Position,
	}
	local fadeOutOpt = {
		Position = UDim2.new(FrameOpt.Position.X.Scale, FrameOpt.Position.X.Offset, 1.5, FrameOpt.Position.Y.Offset),
	}

	-- Tweens para los efectos de los frames
	local showPuntajeTween = TweenService:Create(FramePnt, fadeEffect, showPuntaje)
	local hidePuntajeTween = TweenService:Create(FramePnt, fadeEffect, hidePuntaje)
	local fadeInChrTween = TweenService:Create(FrameChr, fadeEffect, fadeInChr)
	local fadeOutChrTween = TweenService:Create(FrameChr, fadeEffect, fadeOutChr)
	local fadeInPrgTween = TweenService:Create(FramePrg, fadeEffect, fadeInPrg)
	local fadeOutPrgTween = TweenService:Create(FramePrg, fadeEffect, fadeOutPrg)
	local fadeInOptTween = TweenService:Create(FrameOpt, fadeEffect, fadeInOpt)
	local fadeOutOptTween = TweenService:Create(FrameOpt, fadeEffect, fadeOutOpt)

	-- Funciones para mostrar y esconder los frames
	local function showFrames()
		fadeInChrTween:Play()
		fadeInPrgTween:Play()
		fadeInOptTween:Play()
	end
	local function hideFrames()
		fadeOutChrTween:Play()
		fadeOutPrgTween:Play()
		fadeOutOptTween:Play()
	end
	-- Conexiones de eventos para mostrar y esconder los frames
	changeUI.OnClientEvent:Connect(function(show, pntToo)
		-- show: boolean para mostrar u ocultar los frames excepto el puntaje
		if show then
			showFrames()
		else
			hideFrames()
		end
		-- pntToo: boolean para mostrar u ocultar el puntaje solamente
		if pntToo then
			showPuntajeTween:Play()
		else
			hidePuntajeTween:Play()
		end
	end)
end

-- Aplicando los efectos a la interfaz de QuizGUI
DoTweenButtons(op1Bt)
DoTweenButtons(op2Bt)
DoTweenButtons(op3Bt)
DoTweenButtons(op4Bt)

DoTweenChrono(tiempoLbl)

DoTweenFramesQuiz(puntajeLbl.Parent, frameChr, framePrg, frameOpc)
