local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Referencia explícita al RemoteEvent
local ShowWinnerEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("ShowWinner")
local changeUI = ReplicatedStorage:WaitForChild("Remotes").Events:WaitForChild("QuizChange")

local WinnerManager = {}

function WinnerManager.showWinner(winner, score, players)
	for _, player in ipairs(players) do
		changeUI:FireClient(player, false, false)
		ShowWinnerEvent:FireClient(player, winner.Name, score)
	end
	-- ShowWinnerEvent:FireAllClients(winner.Name, score)
end

return WinnerManager
