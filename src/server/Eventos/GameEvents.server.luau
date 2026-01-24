local GameManager = require(game:GetService("ServerScriptService").Server.Modulos.GameManager)

-- Iniciar la gestion de respuestas de los jugadores
--[[
GameManager.getRespuestaJugador("A")
GameManager.getRespuestaJugador("B")
GameManager.getRespuestaJugador("C")
GameManager.getRespuestaJugador("D")
GameManager.getRespuestaJugador("A")
]]

-- @TODO getRespuesta sobreescribe la funcion anterior a esta, un pequeño fallo de diseño pero funciona para pruebas
-- se tendra que implementar la logica para la reutilizacion de esta funcion para las 4 respuestas
-- o mas bien tendria que ver como hacerlo sin necesidad de sobreescribirla
-- aun sigo pensando en como hacerlo .-ZyoN
--[[
GameManager.setPoolPreguntas("Historia", 10)
]]
task.wait(3)
GameManager.initQuiz(30, 10)
