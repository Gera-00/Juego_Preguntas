# Juego de Preguntas Aleatorio (Roblox)

Proyecto de un juego multijugador de cultura general tipo *reality show* para Roblox, pensado para estudiantes de secundaria. Los jugadores compiten en una sola ronda de 10 preguntas, con un presentador virtual, ruleta de temas y sistema de puntajes basado en rapidez de respuesta.

---

## 1. Visión general

**Nombre provisional:** Juego de Preguntas Aleatorio  
**Plataforma:** Roblox  
**Referencia:** Banana Split (dinámica tipo programa de concursos)

El juego se desarrolla en un **único servidor / partida compartida**:

- Todos los jugadores ven **la misma ruleta**, **la misma pregunta** y **el mismo presentador** al mismo tiempo.
- Cada jugador responde de forma individual, pero el **avance de la ronda** es global (todos pasan a la siguiente pregunta al mismo tiempo).
- Una partida está compuesta por **una sola ronda de 10 preguntas**.

---

## 2. Mecánicas principales del juego

### 2.1 Lobby

- Al entrar al juego, el jugador aparece en un **Lobby principal**.  
- Puede **caminar y moverse libremente** dentro de un área definida.  
- En el lobby existe una **Zona de Inicio de Partida**:
	- Al entrar, el jugador queda **registrado** como participante de la siguiente partida.  
	- Cuando hay **al menos 1 jugador** registrado y **no se supera el máximo de 6 jugadores**, se inicia una **cuenta regresiva de 10 segundos**.  
	- Todos los jugadores que estén dentro de la zona al finalizar la cuenta regresiva **entran juntos a la partida**.

### 2.2 Inicio de partida

**Fase 1: Inicio de partida**

- Los jugadores registrados son:
	- **Teletransportados** a la zona de juego.  
	- **Colocados sentados** (para reducir errores de movimiento).  
	- Se **bloquea el movimiento** del personaje durante la ronda.

**Fase 2: Presentación**

- Un **presentador virtual**:
	- Da la bienvenida.  
	- Explica brevemente las reglas.  
	- Muestra texto en pantalla (audio opcional con voz de alumnos).

### 2.3 Selección de tema

**Fase 3: Selección del tema**

- Se muestra una **ruleta de temas**: 7 temas de cultura general.  
- La ruleta **gira automáticamente** y selecciona **1 tema al azar**.  
- El tema seleccionado se **anuncia** a todos los jugadores.  
- Del tema elegido se seleccionan **10 preguntas aleatorias** de las **20 almacenadas**, evitando repeticiones en la misma ronda.

### 2.4 Ronda de preguntas

**Fase 4: Ronda de preguntas (10 preguntas)**

Para cada una de las 10 preguntas:

- Se muestra la **pregunta** y las **4 opciones de respuesta**.  
- Aparece un **temporizador visible**.  
- Cada jugador elige su respuesta en pantalla.  
- Si el jugador **no responde a tiempo**, se considera **incorrecta (0 puntos)**.  
- Al terminar el tiempo:
	- Se revela la **respuesta correcta**.  
	- Se asignan **puntos individuales** a cada jugador.  
	- Se muestra una **tabla de puntaje parcial** con los **3 primeros lugares**.

### 2.5 Sistema de puntaje

Cada pregunta vale:

```text
Puntaje = 100 + (t * 5)
```

- Donde `t` es el **tiempo de respuesta** (cuanto más rápido responda correctamente, más puntos obtiene).  
- Respuesta **incorrecta o no respondida**: **0 puntos**.  
- Los puntos se **acumulan** durante toda la ronda.

### 2.6 Resultados finales

**Fase 5: Resultados finales**

- Al finalizar las 10 preguntas:
	- Se suman los **puntos totales** de cada jugador.  
	- Se muestran:
		- **1er lugar**  
		- **2do lugar**  
		- **3er lugar**  
	- El presentador muestra un **mensaje final**.  
	- Todos los jugadores son **regresados al Lobby** y el juego queda listo para la siguiente partida.

---

## 3. Reglas del juego

- Una **partida** consta de **una sola ronda**.  
- Cada **ronda** consta de **10 preguntas**.  
- El **ganador** se define por el **mayor puntaje acumulado**.  
- En caso de **empate**, los jugadores comparten el lugar (no hay desempate).  
- Jugadores que lleguen **tarde** (cuando la partida ya inició):
	- Permanecen en el **Lobby** y esperan a la siguiente partida.

---

## 4. Requisitos funcionales

### RF-01 Acceso al juego
El sistema debe permitir que los jugadores ingresen al juego y aparezcan en un **Lobby principal**.

### RF-02 Movimiento en el lobby
El sistema debe permitir que los jugadores **caminen libremente** dentro del área definida del Lobby.

### RF-03 Registro para partida
El sistema debe detectar cuando un jugador entra a la **Zona de Inicio de Partida** y **registrarlo** como participante.

### RF-04 Límite de jugadores
El sistema debe permitir un **máximo de 6 jugadores** por partida.

### RF-05 Inicio automático de partida
El sistema debe iniciar una **cuenta regresiva de 10 segundos** cuando:

- Hay al menos **1 jugador registrado**.  
- No se excede el **límite de 6 jugadores**.

### RF-06 Inicio sincronizado
El sistema debe iniciar la partida **simultáneamente** para todos los jugadores registrados al finalizar la cuenta regresiva.

### RF-07 Control de partidas
El sistema debe permitir **solo una partida activa por servidor** y **bloquear nuevos ingresos** a partida mientras esta esté en curso.

### RF-08 Selección automática de tema
El sistema debe seleccionar un **tema al azar** mediante una **ruleta automática** al inicio de la partida.

### RF-09 Gestión de preguntas
El sistema debe:

- Almacenar **7 temas** con **20 preguntas** cada uno.  
- Seleccionar **10 preguntas aleatorias** del tema elegido.  
- **Evitar repetir preguntas** durante la misma ronda.

### RF-10 Presentación de preguntas
El sistema debe mostrar para cada pregunta:

- El **enunciado de la pregunta**.  
- Las **cuatro opciones de respuesta**.  
- Un **temporizador visible** para todos los jugadores.

### RF-11 Registro de respuesta
El sistema debe registrar para cada jugador:

- La **respuesta seleccionada**.  
- El **tiempo de respuesta individual**.

### RF-12 Evaluación de respuesta
El sistema debe:

- Asignar **0 puntos** a respuestas incorrectas o no respondidas.  
- Asignar **100 puntos base + bono por tiempo (t x 5)** a respuestas correctas.

### RF-13 Puntaje acumulado
El sistema debe **acumular el puntaje total** de cada jugador durante la partida.

### RF-14 Tabla de puntaje
El sistema debe mostrar una **tabla de puntaje** durante la partida con los **3 primeros lugares**.

### RF-15 Resultados finales
Al final de la partida, el sistema debe mostrar:

- **Primer lugar**.  
- **Segundo lugar**.  
- **Tercer lugar**.

### RF-16 Presentador virtual
El sistema debe contar con un **presentador virtual** que:

- Muestre mensajes de **texto en pantalla**.  
- (Opcional) Reproduzca **audio**.

### RF-17 Reinicio de juego
El sistema debe **regresar a todos los jugadores al Lobby** al finalizar la partida.

---

## 5. Requisitos no funcionales

- El juego debe ser **intuitivo y fácil de entender** para alumnos de secundaria.  
- La interfaz debe ser **visual y clara**: texto grande, colores alegres y llamativos.  
- El sistema de preguntas debe **evitar repetir preguntas** dentro de una misma ronda.  
- El rendimiento debe permitir **varios jugadores conectados sin fallos** ni caídas importantes de rendimiento.

---

## 6. Arquitectura lógica del proyecto

El proyecto se organiza en varios **módulos principales** (scripts/Managers) dentro de Roblox Studio.

### 6.1 GameManager

- Controla el **estado global del juego** (Lobby, Cuenta Regresiva, En Juego, Resultados, Volver al Lobby).  
- Coordina el **flujo general de la partida**.  
- Asegura que haya **solo una partida activa por servidor**.

### 6.2 LobbyManager

- Administra el **Lobby principal**.  
- Detecta jugadores que entran a la **Zona de Inicio de Partida**.  
- Lleva el **registro de jugadores** para la siguiente partida.  
- Inicia la **cuenta regresiva de 10 segundos** cuando se cumplen las condiciones.

### 6.3 QuestionManager

- Almacena los **7 temas de cultura general**, cada uno con **20 preguntas**.  
- Cada pregunta incluye:  
	- Enunciado.  
	- 4 opciones de respuesta.  
	- 1 respuesta correcta.  
	- 3 respuestas incorrectas.  
- Selecciona **10 preguntas aleatorias** por ronda del tema elegido.  
- Garantiza que **no se repitan** preguntas en la misma ronda.

### 6.4 RoundManager

- Controla el **temporizador** de cada pregunta.  
- Avanza de una pregunta a la siguiente para **todos los jugadores a la vez**.  
- Coordina el flujo: mostrar pregunta → esperar respuestas → mostrar correcta → actualizar puntajes.

### 6.5 ScoreManager

- Calcula el puntaje de cada jugador con la fórmula: `100 + (t * 5)` para respuestas correctas.  
- Asigna **0 puntos** a respuestas incorrectas o no respondidas.  
- Lleva el **acumulado de puntaje** por jugador durante la partida.  
- Ordena a los jugadores para mostrar **ranking parcial** y **final** (top 3).

### 6.6 UIManager

- Maneja todas las **interfaces gráficas (GUI)**:  
	- Pantallas de Lobby / Instrucciones.  
	- Pantalla de **preguntas y opciones**.  
	- **Temporizador** visible.  
	- **Tabla de puntaje** parcial y final.  
	- Mensajes del presentador.  
- Garantiza que la UI sea **clara y legible** (texto grande, colores alegres).

### 6.7 PresenterManager

- Define los **textos del presentador** para:
	- Bienvenida.  
	- Explicación de reglas.  
	- Anuncio del tema.  
	- Comentarios entre preguntas (opcional).  
	- Mensaje final de cierre.  
- (Opcional) Gestiona la reproducción de **clips de audio**.

---

## 7. Flujo general de una partida

1. **Jugador entra al juego** → aparece en el **Lobby**.  
2. El jugador se **mueve libremente** dentro del área permitida.  
3. Al entrar a la **Zona de Inicio**, queda **registrado** para la próxima partida.  
4. Cuando hay **≥ 1 jugador** y **≤ 6 jugadores**, se inicia una **cuenta regresiva de 10 s**.  
5. Al terminar la cuenta regresiva, todos los jugadores registrados son **teletransportados a la zona de juego** y se **sientan**.  
6. El **presentador** da la bienvenida y explica las reglas.  
7. Se muestra la **ruleta**, gira y se elige un **tema aleatorio**.  
8. De ese tema, el sistema selecciona **10 preguntas aleatorias**.  
9. Para cada pregunta:  
	 - Mostrar pregunta + 4 opciones + temporizador.  
	 - Registrar respuesta y tiempo de cada jugador.  
	 - Evaluar y asignar puntaje.  
	 - Mostrar **tabla de puntaje parcial** (top 3).  
10. Tras la pregunta 10:  
		- Calcular **puntaje total** de cada jugador.  
		- Mostrar **podio final** (1°, 2°, 3°).  
		- El presentador da un **mensaje final**.  
		- Todos los jugadores regresan al **Lobby** y se permite iniciar una nueva partida.

---

## 8. Consideraciones de diseño visual y usabilidad

- Interfaz pensada para **alumnos de secundaria**:  
	- Texto grande y legible.  
	- Mensajes directos y sencillos.  
- Uso de **colores alegres y coloridos**, pero cuidando el contraste para mantener la **legibilidad**.  
- Reducir al mínimo las acciones complejas: la mayor parte de la interacción es **caminar al área de inicio** y **hacer clic en una opción de respuesta**.

---

## 9. Implementación técnica (Roblox Studio) – Guía general

> Nota: Esta sección es una guía para la implementación; los detalles concretos de scripts se definirán en el desarrollo.

- Lenguaje: **Lua** (Scripts de Roblox).  
- Ubicación recomendada de módulos/scripts:  
	- `ServerScriptService`: GameManager, LobbyManager, QuestionManager, RoundManager, ScoreManager, PresenterManager.  
	- `ReplicatedStorage`: RemoteEvents y RemoteFunctions para sincronizar UI y respuestas de jugadores.  
	- `StarterGui`: interfaces del UIManager (pantallas de preguntas, resultados, etc.).

### Eventos y comunicación

- Uso de **RemoteEvents** para:  
	- Enviar preguntas y opciones a los clientes.  
	- Recibir respuestas de cada jugador.  
	- Actualizar tablas de puntaje.  
- El servidor mantiene la **lógica central de juego** (estados, preguntas, puntajes).

---

## 10. Trabajo futuro / decisiones pendientes

- Definir exactamente los **7 temas de cultura general** (ej. Historia, Ciencia, Deportes, Arte, Geografía, Tecnología, Cultura Pop).  
- Redactar las **20 preguntas por tema** y sus 4 opciones (1 correcta, 3 incorrectas).  
- Definir el **diseño visual específico** del presentador, escenario y ruleta.  
- Decidir si se incluirá **audio grabado** con voz de alumnos para el presentador.  
- Ajustar el **tiempo del temporizador** por pregunta según pruebas con estudiantes.

---

## 11. Objetivo educativo

Este proyecto busca combinar **entretenimiento** y **aprendizaje**:

- Reforzar conocimientos de **cultura general**.  
- Fomentar la **participación activa** de los estudiantes.  
- Practicar habilidades como **rapidez de decisión** y **atención**.  

---

Si quieres, el siguiente paso puede ser definir la **estructura de datos** para las preguntas (cómo guardarlas en Lua) o el **diagrama de estados del GameManager**.

