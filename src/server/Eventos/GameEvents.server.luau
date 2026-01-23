local GameManager = require(game:GetService("ServerScriptService").Server.Modulos.GameManager)

-- Iniciar la gestion de respuestas de los jugadores
GameManager.getRespuestaJugador("A")
GameManager.getRespuestaJugador("B")
GameManager.getRespuestaJugador("C")
GameManager.getRespuestaJugador("D")
GameManager.getRespuestaJugador("A")

GameManager.setPoolPreguntas("Historia", 10)
