--- Estructura de los datos que usara por parte de backend el juego completo
local GameData = {
	Preguntas = {
		Historia = {

			Facil = {
				{
					Pregunta = "¿Quién descubrió América en 1492?",
					Opciones = {
						A = "Cristóbal Colón",
						B = "Hernán Cortés",
						C = "Américo Vespucio",
						D = "Marco Polo",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Qué civilización construyó las pirámides de Egipto?",
					Opciones = {
						A = "Romanos",
						B = "Egipcios",
						C = "Griegos",
						D = "Mayas",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿En qué país surgió el Imperio Romano?",
					Opciones = {
						A = "Grecia",
						B = "Egipto",
						C = "Italia",
						D = "Francia",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cómo se llamó la guerra entre México y Estados Unidos en 1846?",
					Opciones = {
						A = "Guerra Civil",
						B = "Guerra México-Estados Unidos",
						C = "Guerra de Reforma",
						D = "Guerra del Pacífico",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Quién fue el primer presidente de México?",
					Opciones = {
						A = "Benito Juárez",
						B = "Miguel Hidalgo",
						C = "Guadalupe Victoria",
						D = "Porfirio Díaz",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué guerra ocurrió entre 1939 y 1945?",
					Opciones = {
						A = "Primera Guerra Mundial",
						B = "Guerra Fría",
						C = "Segunda Guerra Mundial",
						D = "Guerra de Vietnam",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Quién fue conocido como el Padre de la Patria en México?",
					Opciones = {
						A = "José María Morelos",
						B = "Miguel Hidalgo",
						C = "Vicente Guerrero",
						D = "Iturbide",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué civilización construyó el Coliseo?",
					Opciones = {
						A = "Griega",
						B = "Egipcia",
						C = "Romana",
						D = "Azteca",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿En qué siglo ocurrió la Independencia de México?",
					Opciones = {
						A = "Siglo XVII",
						B = "Siglo XVIII",
						C = "Siglo XIX",
						D = "Siglo XX",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Quién fue Napoleón Bonaparte?",
					Opciones = {
						A = "Un rey español",
						B = "Un emperador francés",
						C = "Un líder romano",
						D = "Un general alemán",
					},
					Correcta = "B",
				},
			},

			Media = {
				{
					Pregunta = "¿En qué año inició la Independencia de México?",
					Opciones = {
						A = "1808",
						B = "1810",
						C = "1821",
						D = "1836",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué revolución ocurrió en Francia en 1789?",
					Opciones = {
						A = "Revolución Industrial",
						B = "Revolución Francesa",
						C = "Revolución Rusa",
						D = "Revolución Americana",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Quién fue el líder del movimiento insurgente tras la muerte de Hidalgo?",
					Opciones = {
						A = "Vicente Guerrero",
						B = "Agustín de Iturbide",
						C = "José María Morelos",
						D = "Antonio López de Santa Anna",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué guerra terminó en 1945 con la rendición de Alemania?",
					Opciones = {
						A = "Primera Guerra Mundial",
						B = "Guerra Fría",
						C = "Segunda Guerra Mundial",
						D = "Guerra de Corea",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué civilización se desarrolló entre los ríos Tigris y Éufrates?",
					Opciones = {
						A = "Egipcia",
						B = "Mesopotámica",
						C = "China",
						D = "India",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué documento marcó el inicio de la Independencia de Estados Unidos?",
					Opciones = {
						A = "Carta Magna",
						B = "Declaración de Independencia",
						C = "Tratado de Versalles",
						D = "Constitución",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué imperio cayó en 1453 con la toma de Constantinopla?",
					Opciones = {
						A = "Imperio Romano de Occidente",
						B = "Imperio Bizantino",
						C = "Imperio Persa",
						D = "Imperio Otomano",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Quién fue el primer emperador romano?",
					Opciones = {
						A = "Julio César",
						B = "Nerón",
						C = "Augusto",
						D = "Calígula",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿En qué año se consumó la Independencia de México?",
					Opciones = {
						A = "1810",
						B = "1815",
						C = "1821",
						D = "1830",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué periodo histórico ocurrió después de la Edad Media?",
					Opciones = {
						A = "Antigüedad",
						B = "Renacimiento",
						C = "Edad Moderna",
						D = "Edad Contemporánea",
					},
					Correcta = "C",
				},
			},
		},

		Geografia = {

			Facil = {
				{
					Pregunta = "¿Cuál es la capital de Francia?",
					Opciones = {
						A = "Madrid",
						B = "Roma",
						C = "París",
						D = "Berlín",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es el continente más grande del mundo?",
					Opciones = {
						A = "África",
						B = "Europa",
						C = "Asia",
						D = "América",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cómo se llama el océano más grande del planeta?",
					Opciones = {
						A = "Atlántico",
						B = "Índico",
						C = "Ártico",
						D = "Pacífico",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿En qué continente se encuentra México?",
					Opciones = {
						A = "Europa",
						B = "Asia",
						C = "América",
						D = "África",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es el río más largo del mundo?",
					Opciones = {
						A = "Amazonas",
						B = "Nilo",
						C = "Yangtsé",
						D = "Misisipi",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Cuál es el país más grande del mundo por territorio?",
					Opciones = {
						A = "Canadá",
						B = "China",
						C = "Estados Unidos",
						D = "Rusia",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Cuál es la capital de México?",
					Opciones = {
						A = "Guadalajara",
						B = "Monterrey",
						C = "Ciudad de México",
						D = "Puebla",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué país tiene forma de bota?",
					Opciones = {
						A = "España",
						B = "Italia",
						C = "Portugal",
						D = "Grecia",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Cuál es el continente donde se encuentra el desierto del Sahara?",
					Opciones = {
						A = "Asia",
						B = "América",
						C = "África",
						D = "Oceanía",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuántos continentes hay en el mundo?",
					Opciones = {
						A = "5",
						B = "6",
						C = "7",
						D = "8",
					},
					Correcta = "C",
				},
			},

			Media = {
				{
					Pregunta = "¿Qué país tiene la mayor población del mundo?",
					Opciones = {
						A = "India",
						B = "Estados Unidos",
						C = "China",
						D = "Rusia",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Cuál es la capital de Canadá?",
					Opciones = {
						A = "Toronto",
						B = "Vancouver",
						C = "Montreal",
						D = "Ottawa",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿En qué país se encuentra el Monte Everest?",
					Opciones = {
						A = "China",
						B = "India",
						C = "Nepal",
						D = "Bután",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es la capital de Brasil?",
					Opciones = {
						A = "Río de Janeiro",
						B = "São Paulo",
						C = "Brasilia",
						D = "Salvador",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué océano baña las costas del oeste de México?",
					Opciones = {
						A = "Atlántico",
						B = "Índico",
						C = "Ártico",
						D = "Pacífico",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Qué país limita al norte con México?",
					Opciones = {
						A = "Guatemala",
						B = "Belice",
						C = "Estados Unidos",
						D = "Canadá",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es el país más pequeño del mundo?",
					Opciones = {
						A = "Mónaco",
						B = "San Marino",
						C = "Vaticano",
						D = "Liechtenstein",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué cordillera separa Europa de Asia?",
					Opciones = {
						A = "Andes",
						B = "Himalaya",
						C = "Alpes",
						D = "Montes Urales",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Qué país tiene más islas en el mundo?",
					Opciones = {
						A = "Indonesia",
						B = "Filipinas",
						C = "Noruega",
						D = "Suecia",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Cuál es el lago más grande de agua dulce del mundo?",
					Opciones = {
						A = "Lago Victoria",
						B = "Lago Superior",
						C = "Lago Baikal",
						D = "Lago Titicaca",
					},
					Correcta = "B",
				},
			},
		},

		Ciencia = {

			Facil = {
				{
					Pregunta = "¿Qué planeta es conocido como el planeta rojo?",
					Opciones = {
						A = "Venus",
						B = "Marte",
						C = "Júpiter",
						D = "Mercurio",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Cuántos estados de la materia existen comúnmente?",
					Opciones = {
						A = "2",
						B = "3",
						C = "4",
						D = "5",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué órgano del cuerpo humano bombea la sangre?",
					Opciones = {
						A = "Pulmón",
						B = "Cerebro",
						C = "Riñón",
						D = "Corazón",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Qué gas es esencial para la respiración humana?",
					Opciones = {
						A = "Hidrógeno",
						B = "Nitrógeno",
						C = "Oxígeno",
						D = "Dióxido de carbono",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es el animal terrestre más grande del mundo?",
					Opciones = {
						A = "Rinoceronte",
						B = "Elefante",
						C = "Hipopótamo",
						D = "Jirafa",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué parte del cuerpo humano se encarga de pensar?",
					Opciones = {
						A = "Corazón",
						B = "Pulmones",
						C = "Cerebro",
						D = "Hígado",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué fuerza mantiene a los objetos pegados al suelo?",
					Opciones = {
						A = "Fricción",
						B = "Energía",
						C = "Gravedad",
						D = "Magnetismo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué planeta es el más cercano al Sol?",
					Opciones = {
						A = "Mercurio",
						B = "Venus",
						C = "Marte",
						D = "Tierra",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Qué tipo de animal es la ballena?",
					Opciones = {
						A = "Pez",
						B = "Anfibio",
						C = "Reptil",
						D = "Mamífero",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Cuál es el sentido que nos permite ver?",
					Opciones = {
						A = "Oído",
						B = "Olfato",
						C = "Vista",
						D = "Tacto",
					},
					Correcta = "C",
				},
			},

			Media = {
				{
					Pregunta = "¿Cómo se llama el proceso por el cual las plantas producen su alimento?",
					Opciones = {
						A = "Respiración",
						B = "Fotosíntesis",
						C = "Evaporación",
						D = "Fermentación",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué vitamina se obtiene principalmente al exponerse al sol?",
					Opciones = {
						A = "Vitamina A",
						B = "Vitamina B",
						C = "Vitamina C",
						D = "Vitamina D",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Qué parte del cuerpo humano controla el sistema nervioso?",
					Opciones = {
						A = "Corazón",
						B = "Cerebro",
						C = "Pulmones",
						D = "Músculos",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué tipo de energía produce el viento?",
					Opciones = {
						A = "Solar",
						B = "Térmica",
						C = "Eólica",
						D = "Nuclear",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué ciencia estudia los seres vivos?",
					Opciones = {
						A = "Física",
						B = "Química",
						C = "Biología",
						D = "Geología",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué órgano del cuerpo humano se encarga de filtrar la sangre?",
					Opciones = {
						A = "Pulmones",
						B = "Hígado",
						C = "Riñones",
						D = "Intestinos",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué tipo de sangre es considerada donador universal?",
					Opciones = {
						A = "A",
						B = "B",
						C = "AB",
						D = "O",
					},
					Correcta = "D",
				},
				{
					Pregunta = "¿Qué planeta es el más grande del sistema solar?",
					Opciones = {
						A = "Saturno",
						B = "Júpiter",
						C = "Neptuno",
						D = "Urano",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué gas expulsan las plantas durante la fotosíntesis?",
					Opciones = {
						A = "Oxígeno",
						B = "Nitrógeno",
						C = "Dióxido de carbono",
						D = "Hidrógeno",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Qué órgano permite la respiración en los seres humanos?",
					Opciones = {
						A = "Pulmones",
						B = "Corazón",
						C = "Estómago",
						D = "Riñones",
					},
					Correcta = "A",
				},
			},
		},

		ArteYCultura = {

			Facil = {
				{
					Pregunta = "¿Quién pintó la Mona Lisa?",
					Opciones = {
						A = "Vincent van Gogh",
						B = "Pablo Picasso",
						C = "Leonardo da Vinci",
						D = "Miguel Ángel",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué instrumento musical tiene teclas blancas y negras?",
					Opciones = {
						A = "Guitarra",
						B = "Violín",
						C = "Piano",
						D = "Flauta",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿En qué país se originó el ballet?",
					Opciones = {
						A = "Italia",
						B = "Francia",
						C = "Rusia",
						D = "España",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué arte utiliza arcilla o barro para crear figuras?",
					Opciones = {
						A = "Pintura",
						B = "Escultura",
						C = "Cerámica",
						D = "Dibujo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuál es una de las siete bellas artes?",
					Opciones = {
						A = "Programación",
						B = "Arquitectura",
						C = "Deporte",
						D = "Cocina",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué tipo de arte es el cine?",
					Opciones = {
						A = "Arte visual",
						B = "Arte escénico",
						C = "Séptimo arte",
						D = "Arte clásico",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué escritor creó a Don Quijote de la Mancha?",
					Opciones = {
						A = "Gabriel García Márquez",
						B = "Miguel de Cervantes",
						C = "Pablo Neruda",
						D = "Octavio Paz",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué cultura construyó Chichén Itzá?",
					Opciones = {
						A = "Azteca",
						B = "Olmeca",
						C = "Maya",
						D = "Tolteca",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué arte se expresa a través del movimiento del cuerpo?",
					Opciones = {
						A = "Pintura",
						B = "Música",
						C = "Danza",
						D = "Literatura",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué tipo de texto cuenta una historia?",
					Opciones = {
						A = "Poético",
						B = "Narrativo",
						C = "Expositivo",
						D = "Argumentativo",
					},
					Correcta = "B",
				},
			},

			Media = {
				{
					Pregunta = "¿Qué movimiento artístico pintó la vida cotidiana y la luz?",
					Opciones = {
						A = "Cubismo",
						B = "Surrealismo",
						C = "Impresionismo",
						D = "Realismo",
					},
					Correcta = "C",
				},
				{
					Pregunta = '¿Quién pintó el mural "El hombre controlador del universo"?',
					Opciones = {
						A = "José Clemente Orozco",
						B = "David Alfaro Siqueiros",
						C = "Diego Rivera",
						D = "Frida Kahlo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué escritora mexicana es famosa por sus autorretratos?",
					Opciones = {
						A = "Sor Juana Inés de la Cruz",
						B = "Elena Garro",
						C = "Frida Kahlo",
						D = "Rosario Castellanos",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué estilo artístico se caracteriza por figuras geométricas?",
					Opciones = {
						A = "Barroco",
						B = "Cubismo",
						C = "Romanticismo",
						D = "Renacimiento",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué cultura prehispánica creó el calendario solar?",
					Opciones = {
						A = "Maya",
						B = "Azteca",
						C = "Zapoteca",
						D = "Mixteca",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué género literario expresa sentimientos y emociones?",
					Opciones = {
						A = "Narrativo",
						B = "Dramático",
						C = "Lírico",
						D = "Ensayo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué compositor es conocido por la Novena Sinfonía?",
					Opciones = {
						A = "Mozart",
						B = "Bach",
						C = "Beethoven",
						D = "Chopin",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué periodo artístico se inspiró en la cultura grecorromana?",
					Opciones = {
						A = "Gótico",
						B = "Barroco",
						C = "Renacimiento",
						D = "Romanticismo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué manifestación cultural incluye tradiciones y costumbres?",
					Opciones = {
						A = "Arte visual",
						B = "Patrimonio cultural",
						C = "Arquitectura",
						D = "Escultura",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué forma de arte combina actuación, música y escenografía?",
					Opciones = {
						A = "Pintura",
						B = "Ópera",
						C = "Escultura",
						D = "Fotografía",
					},
					Correcta = "B",
				},
			},
		},

		Deportes = {

			Facil = {
				{
					Pregunta = "¿Cuántos jugadores hay en un equipo de fútbol en la cancha?",
					Opciones = {
						A = "9",
						B = "10",
						C = "11",
						D = "12",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿En qué deporte se utiliza una raqueta?",
					Opciones = {
						A = "Fútbol",
						B = "Tenis",
						C = "Natación",
						D = "Boxeo",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué deporte se juega con un balón ovalado?",
					Opciones = {
						A = "Fútbol",
						B = "Baloncesto",
						C = "Rugby",
						D = "Voleibol",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuántos puntos vale un tiro libre en baloncesto?",
					Opciones = {
						A = "1",
						B = "2",
						C = "3",
						D = "4",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Qué país es famoso por el fútbol samba?",
					Opciones = {
						A = "Argentina",
						B = "España",
						C = "Brasil",
						D = "Italia",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué deporte practica Usain Bolt?",
					Opciones = {
						A = "Fútbol",
						B = "Natación",
						C = "Atletismo",
						D = "Ciclismo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué deporte se juega en una piscina?",
					Opciones = {
						A = "Waterpolo",
						B = "Balonmano",
						C = "Béisbol",
						D = "Hockey",
					},
					Correcta = "A",
				},
				{
					Pregunta = "¿Cuántos sets se necesitan para ganar un partido de tenis profesional?",
					Opciones = {
						A = "1",
						B = "2",
						C = "3",
						D = "5",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué deporte utiliza un bate?",
					Opciones = {
						A = "Críquet",
						B = "Béisbol",
						C = "Golf",
						D = "Tenis",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué deporte es conocido como el rey de los deportes?",
					Opciones = {
						A = "Baloncesto",
						B = "Béisbol",
						C = "Fútbol",
						D = "Boxeo",
					},
					Correcta = "C",
				},
			},

			Media = {
				{
					Pregunta = "¿En qué país se originaron los Juegos Olímpicos?",
					Opciones = {
						A = "Italia",
						B = "Grecia",
						C = "Francia",
						D = "Egipto",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Cuántos jugadores conforman un equipo de baloncesto en la cancha?",
					Opciones = {
						A = "4",
						B = "5",
						C = "6",
						D = "7",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué país ha ganado más Copas del Mundo de fútbol?",
					Opciones = {
						A = "Alemania",
						B = "Italia",
						C = "Brasil",
						D = "Argentina",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué deporte se practica en el Tour de Francia?",
					Opciones = {
						A = "Atletismo",
						B = "Ciclismo",
						C = "Motociclismo",
						D = "Automovilismo",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿En qué deporte destacó Michael Jordan?",
					Opciones = {
						A = "Fútbol",
						B = "Béisbol",
						C = "Baloncesto",
						D = "Atletismo",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué deporte combina carrera, ciclismo y natación?",
					Opciones = {
						A = "Pentatlón",
						B = "Decatlón",
						C = "Triatlón",
						D = "Heptatlón",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Cuántos metros mide una maratón?",
					Opciones = {
						A = "40,000",
						B = "41,195",
						C = "42,195",
						D = "43,000",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿Qué país es famoso por el sumo?",
					Opciones = {
						A = "China",
						B = "Corea",
						C = "Japón",
						D = "Tailandia",
					},
					Correcta = "C",
				},
				{
					Pregunta = "¿En qué deporte se gana un cinturón como premio?",
					Opciones = {
						A = "Lucha libre",
						B = "Boxeo",
						C = "Judo",
						D = "Karate",
					},
					Correcta = "B",
				},
				{
					Pregunta = "¿Qué evento deportivo se celebra cada cuatro años?",
					Opciones = {
						A = "Super Bowl",
						B = "Juegos Olímpicos",
						C = "Copa América",
						D = "Tour de Francia",
					},
					Correcta = "B",
				},
			},
		},
	},
}

return GameData
