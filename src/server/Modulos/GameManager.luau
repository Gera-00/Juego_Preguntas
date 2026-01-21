--- Modulo encargado del manejo de funciones principales del juego
--- @class GameManager
local GameManager = {
	["Data"] = require(game:GetService("ServerScriptService").Server.Modulos.GameData),
}

---
GameManager.getRespuestaJugador = function(jugador)
	-- Implementacion de la logica para obtener la respuesta del jugador
	local CheckResultEvent = game:GetService("ReplicatedStorage"):WaitForChild("CheckResult")
	CheckResultEvent.FireServer:Connect(function(respuesta)
		local exito, mensaje = pcall(function()
			-- Con un simple if
		end)
		if not exito then
			warn("Error al verificar la respuesta del jugador: " .. mensaje)
		end
	end)
end

GameManager.setRevoltijoPreg = function() end

return GameManager
