# A1 · Pilares / constitución de diseño
### Entregable de la iteración A1 (v1.0 · **Aprobado**) · *parte de* `Plan-de-Iteraciones.md`

> **Qué es esto:** la constitución del juego. Fija los innegociables y cierra las decisiones abiertas (permadeath y PvP). Todo peldaño posterior se subordina a esto. Tocar este documento puede invalidar trabajo aguas abajo (ver *Propagación de cambios* en el plan).

---

## Los pilares

1. **El vínculo es el motor; la competencia es la apuesta.**
   El sistema central sigue siendo la relación con el dragón. Pero el juego tiene **stakes reales**: podés arriesgar a tu dragón. El vínculo no compite con la competencia — es *lo que hace que la apuesta importe*. Nadie arriesga una planilla de stats; arriesgás una criatura que criaste.

2. **Unicidad por biografía, no por stats.**
   Lo que hace único a un dragón es su historia vivida (cicatrices, dieta, clima, batallas y los recuerdos asociados), no una tirada de números. Dos dragones con el mismo genotipo deben sentirse distintos por lo que vivieron.

3. **Vínculo negociado + obediencia imperfecta.**
   No hay barra de lealtad que sube con clicks. Confianza/respeto/apego se ganan y se pierden con el trato. Se traducen en obediencia imperfecta: das intenciones, el dragón decide si las ejecuta según cómo lo criaste. **Esto aplica también en la arena:** los stats crudos no alcanzan; sin vínculo, el dragón puede no obedecer bajo presión.

4. **El estado físico se mantiene, no se compra.**
   Subir stats de daño/combate hace al dragón **más exigente de mantener**: más alimentación, más entrenamiento, más atención. Si el jugador no interactúa, el dragón **pierde estado físico y se debilita**. El poder es una relación continua, no una compra única.

5. **La pérdida tiene sentido y tiene precio.**
   El ciclo de vida y la muerte son parte del arco emocional, anticipados y con legado. La muerte es **permanente por defecto**; recuperar al dragón es una decisión económica deliberada, no un respawn gratis.

---

## Decisiones cerradas

### Permadeath — **Canon, sin reencarnación** *(actualizado por A6/D3)*
- El dragón **muere de forma permanente** por defecto. La muerte es real.
- **No hay reencarnación** (por ahora). Tras la muerte, el jugador **cría otro** (gratis) o, si lo preparó en vida, continúa por **legado generacional** (mentoría en paralelo, ver A6).
- **Revivir** queda como **mención a futuro**, con un **item muy caro de dinero real**, fuera de foco. **El camino feliz del juego es sin revivir**: se vive el duelo y se sigue.
- *(Cambio propagado: la versión v1.0 de A1 tenía "reencarnar pagando créditos"; A6/D3 lo eliminó.)*

### PvP — **Incluido, en dos modos**
- **PvP a muerte (competitivo):**
  - Los jugadores **apuestan grandes cantidades de monedas**.
  - El dragón perdedor sufre **permadeath**.
  - El ganador recibe **su apuesta + un bonus del juego** por matar al dragón rival.
- **PvP de práctica:**
  - Permite apostar entre jugadores, pero **con un tope de monedas**.
  - **No mata**: deja al dragón **debilitado**; debe **recuperarse 24 h** (el jugador vuelve a interactuar) antes de volver a estar full.

### Economía — **Doble moneda (registrada, se especifica después)**
- **Monedas** (in-game: apuestas de PvP, veterinario, adiestrador, longevidad, medicamentos, limpieza de traumas) y **créditos** (rol redefinido tras eliminar la reencarnación — a fijar en el Track E). El **revivir** futuro usa **dinero real**, no créditos. Fuentes, sinks y compra con dinero real se diseñan en el **Track E (Economía)**.

---

## Tensión de diseño registrada *(decisión consciente)*

El GDD advierte que **el PvP competitivo tiende a matar el apego** (empuja a min-maxear stats en vez de cuidar al dragón). Al incluir PvP a muerte con apuestas + bonus por matar, aceptamos ese riesgo a cambio de **stakes reales**. La constitución lo reconcilia así:

- El **vínculo sigue siendo mecánicamente necesario en la arena** (obediencia imperfecta, pilar 3): sin relación, no hay control bajo presión.
- El **mantenimiento continuo** (pilar 4) castiga al que trata al dragón como planilla y no lo cuida.
- La **permadeath con costo** (pilar 5) hace que la derrota duela de verdad, reforzando el apego en lugar de erosionarlo.

**Riesgo abierto a vigilar:** un bonus del juego *por matar* al dragón rival puede atraer un perfil de jugador puramente depredador y presionar hacia una economía extractiva. Anotado para revisar cuando diseñemos economía y A7 (batalla).

---

## Pasos a futuro *(anotado, no se decide en A1)*

### Plataforma — PC como juego completo + app companion móvil
- El **juego completo se juega en PC**: combate, PvP, crianza, todo.
- Habrá una **app aparte (móvil/portátil)** que funciona como **mascota interactiva**, con alcance acotado:
  - **Sí:** mantener al dragón en forma (evitar la pérdida de estado físico del pilar 4), alimentarlo, entrenamiento de mantenimiento, interacción diaria.
  - **No:** combatir, PvP, ni el juego completo.
- Idea rectora: la app existe para que el pilar 4 (*el estado físico se mantiene, no se compra*) no obligue a estar frente a la PC. Es una extensión del **cuidado**, no del **juego**.
- **Sin decidir todavía:** sincronización PC↔app, si es online/offline, tecnología, y si el mantenimiento en la app es suficiente o solo parcial. Se retoma cuando planifiquemos plataforma/infra.

---

## Definición de Hecho (checklist de la compuerta)

- [x] Pilares escritos.
- [x] Postura sobre **permadeath** definida (canon + reversión pagada).
- [x] Postura sobre **PvP** definida (incluido, dos modos).
- [x] **Confirmado por vos** (aprobado 2026-07-02).

---

## Impactos aguas abajo (para cuando A1 se apruebe)

- **A2 (Modelo):** el estado físico / condición debe ser una capa modelable que decae con el abandono.
- **A3 (Vínculo):** obediencia imperfecta tiene que funcionar bajo la presión de la arena, no solo en el cuidado diario.
- **A6 (Ciclo de vida):** muerte por PvP entra como causa de muerte junto a vejez; reencarnación/revivir son parte del sistema de legado.
- **A7 (Batalla):** dos contextos (práctica vs. a muerte), apuestas, debilitamiento 24 h, bonus por matar.
- **Nuevo sistema (Economía):** monedas vs. créditos, apuestas, sinks. Antes estaba fuera de alcance; estas decisiones lo empujan a ser un track propio.
