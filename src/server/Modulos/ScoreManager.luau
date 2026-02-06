local ScoreManger = {}

--Diccionario de Scores
local scores = {}

----------------------------------------------------
---- INIT SCORES
----------------------------------------------------
function ScoreManger.init(players)
	scores = {}

	for _, player in ipairs(players) do
		scores[player] = 0
		print("[ScoresManager] Score inicializado para:", player.Name)
	end
end

----------------------------------------------------
---- ADD SCORE
----------------------------------------------------
function ScoreManger.addPoints(player, points)
	if not scores[player] then
		warn("[ScoreManager] Jugador no encontrado", player.Name)
		return
	end

	scores[player] += points
	print("[ScoreManager]", player.Name, "ahora tiene", scores[player], "puntos")
end

----------------------------------------------------
---- GET SCORE
----------------------------------------------------
function ScoreManger.getScore(player)
	return scores[player] or 0
end

----------------------------------------------------
---- GET ALL SCORES
----------------------------------------------------
function ScoreManger.getAllScores()
	return scores
end

----------------------------------------------------
---- GET A WINNER
----------------------------------------------------
function ScoreManger.getWinner()
	local winner = nil
	local hihgestScore = -math.huge

	for player, score in pairs(scores) do
		if score > hihgestScore then
			hihgestScore = score
			winner = player
		end
	end
	return winner, hihgestScore
end

----------------------------------------------------
---- RESET
----------------------------------------------------
function ScoreManger.reset()
	scores = {}
	print("[ScoreManager] Scores reiniciados")
end

return ScoreManger

--Ejemplo de uso:

--AGREGAR SCORE A UN JUGADOR
--ScoreManager.addPoints(player, 10)

--PARA CONSULTAR TODO
--local score = ScoreManager.getScore(player)

--[[
local verResp = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Functions").CheckResultado
	verResp.OnServerInvoke = function(player, respuesta, tiempoResp)
		local calcPunt = 100 + (tiempoResp * 2)
		if respuestaActual == respuesta then
			print("Respuesta correcta del jugador: " .. player.Name)
			return calcPunt
		else
			print("Respuesta incorrecta del jugador: " .. player.Name)
			return 0
		end
	end
]]
