# Tareas del Proyecto - Juego de Preguntas Aleatorio

## 📋 PENDIENTE

### Implementación de LobbyManager
- [ ] Crear archivo LobbyManager.luau
- [ ] Implementar función init() para detectar zona de inicio
- [ ] Implementar función registerPlayer() para registrar jugadores
- [ ] Implementar función unregisterPlayer() para desregistrar jugadores
- [ ] Implementar función isPlayerInZone() para verificar posición del jugador
- [ ] Implementar función startCountdown() para cuenta regresiva de 10 segundos
- [ ] Implementar función teleportPlayer() para teletransportar jugadores a zona de juego
- [ ] Implementar función startGame() para iniciar partida
- [ ] Conectar LobbyManager con GameManager
- [ ] Probar flujo completo de Lobby a Partida

### Sistema de Teletransporte y Movimiento
- [ ] Crear zonas en workspace: Lobby_Escenario y Partida_Escenario
- [ ] Crear StartGameZone en Lobby_Escenario
- [ ] Crear SpawnGameZone en Partida_Escenario
- [ ] Implementar bloqueo de movimiento durante partida
- [ ] Implementar sentado automático de jugadores al iniciar partida
- [ ] Probar teletransporte de múltiples jugadores simultáneamente

### Sistema de Preguntas y Opciones (Mejoras)
- [ ] Corregir bug de sobrescritura en getRespuestaJugador()
- [ ] Implementar sistema de espera de respuestas de todos los jugadores
- [ ] Agregar validación de respuesta única por jugador por pregunta
- [ ] Implementar deshabilitado de botones después de responder
- [ ] Agregar feedback visual al seleccionar una opción
- [ ] Mostrar respuesta correcta al finalizar tiempo de pregunta

### Sistema de Cronómetro
- [ ] Implementar UI visual del cronómetro
- [ ] Conectar chronoPreguntas() con la UI del cliente
- [ ] Agregar animaciones al cronómetro (cambio de color en últimos segundos)
- [ ] Sincronizar cronómetro entre todos los jugadores
- [ ] Probar cronómetro con múltiples jugadores

### Sistema de Puntaje
- [ ] Implementar ScoreManager.luau
- [ ] Crear función para calcular puntaje: 100 + (t * 5)
- [ ] Implementar tabla de puntaje parcial (Top 3)
- [ ] Implementar tabla de puntaje final (Top 3)
- [ ] Crear UI para mostrar puntaje individual del jugador
- [ ] Crear UI para mostrar tabla de puntajes
- [ ] Implementar evento SetPuntos para actualizar UI
- [ ] Probar cálculo de puntaje con diferentes tiempos de respuesta

### Sistema de Ruleta de Temas
- [ ] Crear UI visual de la ruleta
- [ ] Implementar animación de giro de ruleta
- [ ] Mostrar tema seleccionado a todos los jugadores
- [ ] Agregar sonido a la ruleta (opcional)
- [ ] Probar selección aleatoria de temas

### Sistema de Presentador
- [ ] Crear PresenterManager.luau
- [ ] Definir mensajes del presentador:
  - [ ] Mensaje de bienvenida
  - [ ] Explicación de reglas
  - [ ] Anuncio de tema seleccionado
  - [ ] Comentarios entre preguntas
  - [ ] Mensaje final de cierre
- [ ] Crear UI para mostrar mensajes del presentador
- [ ] Implementar sistema de diálogo secuencial
- [ ] Agregar modelo 3D del presentador (opcional)
- [ ] Grabar audios con voz de alumnos (opcional)

### Banco de Preguntas
- [ ] Revisar y validar las 20 preguntas de Historia
- [ ] Revisar y validar las 20 preguntas de Geografía
- [ ] Revisar y validar las 20 preguntas de Ciencia
- [ ] Revisar y validar las 20 preguntas de Arte y Cultura
- [ ] Revisar y validar las 20 preguntas de Deportes
- [ ] Agregar tema 6: Tecnología (20 preguntas)
- [ ] Agregar tema 7: Cultura Pop (20 preguntas)
- [ ] Balancear dificultad entre preguntas Fácil y Media

### Diseño Visual del Juego
- [ ] Diseñar escenario del Lobby
- [ ] Diseñar escenario de la Partida
- [ ] Diseñar UI de preguntas y opciones
- [ ] Diseñar UI de cronómetro
- [ ] Diseñar UI de tabla de puntajes
- [ ] Diseñar UI del presentador
- [ ] Elegir paleta de colores (alegre pero legible)
- [ ] Crear iluminación del escenario
- [ ] Agregar decoraciones temáticas

### Testing y Depuración
- [ ] Probar con 1 jugador
- [ ] Probar con 2-3 jugadores
- [ ] Probar con 6 jugadores (máximo)
- [ ] Probar con jugadores llegando tarde
- [ ] Probar desconexión de jugadores durante partida
- [ ] Probar múltiples partidas consecutivas
- [ ] Verificar sincronización entre jugadores
- [ ] Verificar que no haya memory leaks

## 🔄 PLANNING

### Sistema de Control de Estado del Juego
- [ ] Crear enumeración de estados: Lobby, Countdown, Playing, Results
- [ ] Implementar máquina de estados en GameManager
- [ ] Agregar transiciones entre estados
- [ ] Implementar manejo de errores en transiciones

### Optimización
- [ ] Optimizar envío de eventos remotos
- [ ] Reducir llamadas a WaitForChild()
- [ ] Implementar pooling de objetos UI
- [ ] Optimizar actualización de puntajes

### Documentación
- [ ] Documentar funciones de GameManager
- [ ] Documentar funciones de LobbyManager
- [ ] Documentar estructura de datos de preguntas
- [ ] Crear guía de instalación
- [ ] Crear guía de uso para profesores

## ✅ EN CURSO

### GameManager(): Codificar lógica de envío de Cliente-Servidor para las...
- [x] Implementar initQuiz()
- [x] Implementar setPoolPreguntas()
- [x] Implementar ruletaTemas()
- [x] Implementar chronoPreguntas()
- [x] Implementar getRespuestaJugador()
- [x] Conectar eventos remotos SetPregunta y SetOpciones
- [x] Corregir task.wait(3000) a task.wait(3)
- [ ] Resolver bug de sobrescritura de getRespuestaJugador()
- [ ] Implementar lógica de espera de respuestas

### Diseñar Escenario de Partida
- [ ] Crear área de asientos para jugadores
- [ ] Crear pantalla grande para mostrar preguntas
- [ ] Crear decoración temática
- [ ] Agregar iluminación

### Diseñar Escenario de Lobby
- [ ] Crear área de espera
- [ ] Crear zona de inicio (StartGameZone)
- [ ] Agregar señalización
- [ ] Agregar decoración

## ⚠️ AT RISK

Ninguna tarea en riesgo actualmente.

## 🔄 UPDATE REQUIRED

Ninguna tarea requiere actualización actualmente.

---

## 📊 Resumen de Progreso

### Por Módulo

#### GameManager
- [x] Estructura básica
- [x] Función ruletaTemas
- [x] Función setPoolPreguntas
- [x] Función chronoPreguntas
- [x] Función getRespuestaJugador
- [x] Función initQuiz
- [ ] Integración completa

#### LobbyManager
- [ ] Estructura básica
- [ ] Detección de zona
- [ ] Registro de jugadores
- [ ] Cuenta regresiva
- [ ] Inicio de partida

#### ScoreManager
- [ ] No iniciado

#### PresenterManager
- [ ] No iniciado

#### UIManager
- [ ] Parcialmente implementado
- [x] UI de preguntas
- [x] UI de opciones
- [ ] UI de cronómetro
- [ ] UI de puntajes
- [ ] UI de presentador

### Por Prioridad

#### 🔴 Alta Prioridad
- Sistema de Teletransporte y Movimiento
- Sistema de Cronómetro
- Sistema de Puntaje
- Corregir bugs actuales

#### 🟡 Media Prioridad
- Sistema de Ruleta de Temas (UI visual)
- Sistema de Presentador
- Diseño Visual del Juego
- Testing completo

#### 🟢 Baja Prioridad
- Banco de Preguntas (temas 6 y 7)
- Optimización
- Documentación extensa
- Audio del presentador

---

## 📝 Notas Importantes

### Bugs Conocidos
1. `getRespuestaJugador()` se sobrescribe en cada llamada - necesita rediseño
2. Los clientes reciben eventos pero no actualizan UI correctamente - **RESUELTO**
3. `task.wait(3000)` debería ser `task.wait(3)` - **RESUELTO**

### Decisiones Pendientes
1. ¿Incluir audio grabado con voz de alumnos?
2. ¿Tiempo exacto del temporizador por pregunta? (actualmente 30s)
3. ¿Definir los 2 temas faltantes: Tecnología y Cultura Pop?
4. ¿Implementar sistema de desempate o permitir empates?

### Dependencias
- LobbyManager requiere zonas en workspace
- ScoreManager requiere eventos remotos adicionales
- PresenterManager requiere UI específica
- Testing completo requiere todos los módulos funcionando
