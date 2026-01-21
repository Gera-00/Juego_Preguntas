--- Estructura de los datos que usara por parte de backend el juego completo,
--- @class GameData
local GameData = {
	-- En la clasificacion de como se nombran las variables y
	Preguntas = {

		Historia = {
			{
				Complejidad = "Facil",
				P1_H_F = "¿Quién descubrió América en 1492?",
				Respuestas = {
					R1 = "Cristóbal Colón",
					R2 = "Hernán Cortés",
					R3 = "Américo Vespucio",
					R4 = "Marco Polo",
				},
				Correcta = "R1",
			},
			{
				Complejidad = "Media",
				P2_H_M = "¿Qué revolución ocurrió en Francia en 1789?",
				Respuestas = {
					R1 = "Revolución Industrial",
					R2 = "Revolución Francesa",
					R3 = "Revolución Rusa",
					R4 = "Revolución Americana",
				},
				Correcta = "R2",
			},
		},

		Geografia = { ... },
		Ciencia = { ... },
		Mexico = { ... },
	},
}

return GameData
