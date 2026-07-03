# CLAUDE.md — Drablock (handoff)

> **Para el agente que levanta este proyecto (Fable u otro):** esto es el punto de entrada. Leé este archivo entero antes de tocar nada. La planificación de diseño está **completa**; el objetivo ahora es **construir el MVP de punta a punta**.
>
> **Tenés autonomía para desarrollar todo lo solicitado sin pedir aprobación paso a paso.** El diseño ya fue decidido y está en los specs. Cuando falte un dato o tengas que asumir algo, **no te frenes: tomá la decisión razonable y registrala** en `Registro-Decisiones-IA.md` (ver más abajo). Solo detenete a preguntar si una ambigüedad cambia el diseño de forma grande e irreversible.
>
> **Ubicación:** este directorio (`drablock/`) es la **raíz del repositorio** (git ya inicializado). Todas las rutas de este documento son relativas a acá.

---

## Qué es Drablock

Un juego de **crianza y vínculo con dragones** en **2D (Godot 4)**. No es un juego de combate con mascotas: es un juego de **relación** donde el combate es una **expresión del vínculo**. Criás un dragón único, lo cuidás como a una mascota real, y tu relación con él determina literalmente cuánto te obedece.

**El hook central:** la **obediencia imperfecta es la fidelidad del control**. Controlás al dragón en tiempo real, pero si el vínculo o su estado físico flaquean, los mandos fallan (inputs ignorados, invertidos, acciones recortadas). Tu vínculo *se siente en las manos*.

---

## Estado actual del proyecto

| Fase | Estado |
|---|---|
| Diseño del núcleo (A1–A7) | ✅ Completo y aprobado |
| Economía (E1) | ✅ Completo y aprobado |
| Spike técnico 2D (B1) | 🟡 Prototipo entregado, **falta correrlo y escribir la conclusión** |
| Backlog del MVP (C1) | 🟡 Borrador ordenado, provisional sobre B1 |
| Construcción del MVP | ⏳ **Este es el próximo trabajo** |

**Lo primero a hacer:** correr el spike `godot-b1-spike/` en Godot 4.2+ y completar `B1-Spike-nota.md`. Si sostiene la premisa (unicidad procedural barata en 2D), arrancar el MVP por `C1-Backlog-MVP.md`.

---

## Orden de lectura recomendado (30–40 min y entendés todo)

Leé en este orden. Cada spec es autocontenido y cierra con *Decisiones resueltas* + *Impactos aguas abajo* + *Definición de Hecho*.

1. **Este `CLAUDE.md`** — el mapa completo (ya lo estás leyendo).
2. `A1-Pilares.md` — la constitución. Los 5 pilares filtran todo.
3. `A2-Modelo-del-dragon.md` — cómo está hecho un dragón (4 capas). **Es el modelo de datos.**
4. `A3-Vinculo-obediencia.md` — el corazón: vínculo + obediencia imperfecta.
5. `A4-Biografia.md` → `A5-Personalidad-crianza.md` → `A6-Ciclo-de-vida-muerte.md` — las capas que dan profundidad.
6. `A7-Sistema-de-batalla.md` — combate = fidelidad de control (el hook).
7. `E1-Economia.md` — monedas, sinks, estructura del mundo.
8. `C1-Backlog-MVP.md` — **qué construir y en qué orden.**
9. `GDD-Dragones-Vinculo.md` — visión/contexto (opcional, largo; leelo si querés el *por qué* profundo).

`Plan-de-Iteraciones.md` es meta (el proceso y el tablero de estado); consultalo si dudás del estado de algo.

---

## Modo de trabajo y registro de decisiones *(obligatorio)*

Mantené la bitácora **`Registro-Decisiones-IA.md`** (en este mismo directorio). Anotá ahí **toda decisión o asunción que no esté explícita en los specs**: números que fijes (los specs dejan el balance "a tuning"), reglas por defecto, ambigüedades que resuelvas, desvíos, stubs. El documento tiene las reglas y el formato. Esto le permite al dueño revisar lo que decidiste sin tu conversación, y a cualquier agente futuro entender el porqué del código.

> Regla simple: **si tuviste que "inventar" algo para avanzar, va al registro.**

---

## Setup, requisitos y autonomía *(leé esto antes de codear)*

### ¿Se puede desarrollar autónomo?
**Sí para escribir todo el juego** (código, escenas, shaders, lógica). **No al 100% para llegar a un juego pulido y verificado**, porque dos cosas dependen del entorno y del dueño:
- **Godot debe estar instalado** para correr/testear. Sin Godot, escribís a ciegas (no podés cazar errores de runtime ni ver el resultado).
- **El "feel" y el test emocional los juzga un humano** (ver *Definición de Hecho del MVP*). Eso no se automatiza.

### Requisitos
| Necesitás | Para qué | ¿Obligatorio? |
|---|---|---|
| **Godot 4.2+** | Correr, testear e iterar el juego | **Sí** |
| Display o `xvfb` (framebuffer virtual) | *Ejecutar* el juego (no solo chequeo headless) | Para ver/jugar |
| **Git** | Versionar (el repo ya está iniciado en este directorio) | Recomendado |
| Assets de arte | **No hace falta** para el MVP: el dragón es **procedural** (dibujado por código) | No |

### Instalar y verificar (macOS)
```bash
# Instalar Godot 4 (una opción)
brew install --cask godot
# Si el binario no queda en PATH, usá la ruta del .app:
GODOT="/Applications/Godot.app/Contents/MacOS/Godot"

# Verificar versión (debe ser 4.2+)
"$GODOT" --version

# Parado en la raíz del repo (este directorio, drablock/):

# 1) Chequeo headless del spike: importa el proyecto y sale, mostrando errores de script
"$GODOT" --headless --path godot-b1-spike --quit

# 2) Correr el spike con ventana (para VER los 12 dragones; R = regenerar)
"$GODOT" --path godot-b1-spike
```
*(En otros SO: descargá el binario de https://godotengine.org/download y usá los mismos flags `--headless --path ... --quit` y `--path ...`.)*

### Árbol de decisión para Fable
- **¿Hay `godot` disponible en el entorno?**
  - **Sí →** corré el chequeo headless del spike; si hay errores, arreglalos; corré el spike; **empezá a construir el MVP autónomo** siguiendo C1, registrando asunciones.
  - **No →** escribí igual todo el código siguiendo C1, pero **avisá al dueño** que no pudiste verificar en ejecución y pedile que corra y te pase errores. No des por "hecho" nada que no corriste.
- **¿Llegaste al vertical slice?** → pedile al dueño que lo **juegue** y valide el hook emocional (eso no lo podés juzgar vos).

### Checklist de la primera sesión de Fable
1. Leer `CLAUDE.md` (este archivo) y el orden de lectura.
2. Verificar Godot (`--version`).
3. Chequear + correr el spike; cerrar `B1-Spike-nota.md`.
4. Crear el proyecto del juego en `game/` (ver *Convenciones de proyecto* abajo).
5. Implementar el **vertical slice** de C1 (US-01, 03, 04, 05, 06, 08, 09, 11, 13).
6. Registrar cada asunción en `Registro-Decisiones-IA.md`.
7. Entregar el slice al dueño para playtest.

---

## Fuente de verdad y jerarquía de documentos

Hay dos niveles de documento y **es crítico entender cuál manda**:

1. **`GDD-Dragones-Vinculo.md`** — el **documento conceptual fundacional** (v0.1). Rico, ambicioso, ofrece *varias direcciones* con recomendaciones. Es excelente **contexto y visión**, pero es un *menú*, no las decisiones finales.
2. **`A1`–`A7` + `E1`** — los **specs de decisión**. Son las decisiones **tomadas y confirmadas** por el dueño del proyecto, iteradas en compuertas. **Estos mandan.**

> ⚠️ **Regla de jerarquía:** donde el GDD y los specs difieran, **ganan los specs** (son posteriores y reflejan las decisiones reales del dueño). El GDD te da el *por qué* y la visión; los specs te dan el *qué construir*.

### Divergencias clave (GDD dice X, pero se decidió Y)

| Tema | GDD (visión original) | **Decisión vigente (specs)** |
|---|---|---|
| Dimensión | 3D low-poly/stylized modular | **2D en Godot** (indie, barato) — ver B1 |
| PvP | Desaconsejado; solo exhibición amistosa | **PvP a muerte con apuestas + permadeath**, pero **pactado/consensuado** (A1, E1) |
| Muerte | Permadeath *modulada* (modo suave opcional) | **Permadeath canon** (A1) |
| Continuidad | Linaje/breeding (Concepto C) | **Legado generacional por mentoría**; genética diferida (A6, Track A') |
| Economía | No monetización explícita | **Dos monedas + sinks + dinero real cosmético** (E1) |
| Elementos | Composicional como identidad (recomendado) | **Afinidad simple** en el núcleo; composición diferida (A7) |

El resto del GDD (tesis de "unicidad por biografía", modelo de 4 capas, obediencia imperfecta, vínculo multidimensional, cicatrices con recuerdo) **sí está vigente** y los specs lo desarrollan.

---

## Mapa de archivos *(todo en este directorio = raíz del repo)*

| Archivo | Qué contiene |
|---|---|
| `CLAUDE.md` | Este archivo: el handoff y mapa completo. **Punto de entrada.** |
| `Registro-Decisiones-IA.md` | **Bitácora que mantenés vos:** cada decisión/asunción que tomes al desarrollar. |
| `GDD-Dragones-Vinculo.md` | Documento conceptual fundacional (visión, menú de direcciones). **Contexto, no decisiones — ver jerarquía arriba.** |
| `Plan-de-Iteraciones.md` | El pipeline, el tablero de estado, propagación de cambios, fuera de alcance. |
| `A1-Pilares.md` | Constitución: 5 pilares, permadeath, PvP, plataforma. **Empezá acá.** |
| `A2-Modelo-del-dragon.md` | Dragón en 4 capas (Genotipo/Fenotipo/Biografía/Vínculo), edad, `stat_efectivo`. |
| `A3-Vinculo-obediencia.md` | Confianza/Respeto/Apego, obediencia imperfecta, diagrama de estados. |
| `A4-Biografia.md` | Log de eventos, cicatrices, traumas, veterinario, permanencia. |
| `A5-Personalidad-crianza.md` | 8 ejes de temperamento, ventanas de desarrollo, etiquetas emergentes. |
| `A6-Ciclo-de-vida-muerte.md` | Etapas de edad, muerte anticipada, memorial, legado generacional. |
| `A7-Sistema-de-batalla.md` | Tiempo real + **fidelidad de control**, habilidades, elementos, diagrama de encuentro. |
| `E1-Economia.md` | Dos monedas, sinks, anti pay-to-win, PvP pactado, estructura del mundo. |
| `B1-Spike-nota.md` | Nota de conclusión del spike (a completar tras correr el prototipo). |
| `godot-b1-spike/` | **Proyecto Godot 4 corrible** — 12 dragones procedurales, 0 assets. |
| `C1-Backlog-MVP.md` | Épicas + historias de usuario ordenadas del MVP. |
| `game/` | *(a crear)* el proyecto Godot del **juego** (separado del spike). |

---

## El juego en 60 segundos (para no leer 9 specs de una)

- **Pilares:** vínculo es el motor; unicidad por biografía (no por stats); vínculo negociado + obediencia imperfecta; el estado físico se mantiene (no se compra); la pérdida tiene sentido y precio.
- **4 capas del dragón:** Genotipo (heredado, fijo) → Fenotipo (lo que es ahora + condición que decae + edad) → Biografía (log de cicatrices/recuerdos) → Vínculo (Confianza/Respeto/Apego, vive en la díada).
- **Obediencia:** das input, sale un bucket (acata / a medias / duda / ignora / desvía / se rebela). En combate = fidelidad de los mandos.
- **Muerte:** permadeath real y anticipada. Continuidad por **legado generacional** (criar al sucesor en paralelo, el viejo lo mentorea) — *fuera del MVP*.
- **Economía:** Monedas (del juego, se ganan jugando; pagan cuidado, veterinario, apuestas) + Créditos (dinero real, solo cosmético/conveniencia). **Anti pay-to-win estricto.**
- **PvP:** solo **pactado** (1v1/NvN, ambos arriesgan permadeath) — *fuera del MVP*.
- **Mundo:** por ahora **individual** (sin mundo compartido); entrenás vía minijuegos.

---

## El loop del MVP (la experiencia de punta a punta)

Esto es lo que un jugador **hace y siente** en el MVP, de principio a fin:

1. **Nace tu dragón** — procedural, único (genoma → apariencia). Es *tuyo* desde el principio.
2. **Vive en tu recinto** — un espacio 2D donde lo ves, reacciona a vos, tiene necesidades.
3. **Lo cuidás** — lo alimentás, mantenés su **condición física** (que decae si lo descuidás). Cuesta Monedas.
4. **Lo entrenás** — jugás un **minijuego** (plataformas/skill) que te da **Monedas** y mejora sus capacidades por uso.
5. **Te obedece imperfectamente** — en el minijuego, **si el vínculo o la condición están bajos, los controles fallan**. A medida que lo cuidás y ganás su confianza, respondés mejor. *(Este es el momento que el juego tiene que hacer sentir.)*
6. **Lees su estado por conducta** — nunca hay barras; ves frases ("te busca", "inquieto") y su cuerpo. El **veterinario** pago te da más detalle si lo necesitás.
7. **Se marca** — un evento le deja su **primera cicatriz permanente**, con su recuerdo. Su cuerpo empieza a ser su historia.
8. **Podés perderlo** — si lo descuidás gravemente o un evento sale mal, **muere de verdad** (permadeath). Queda su **memorial**; podés criar otro y empezar de nuevo.

**El test emocional (heredado del GDD):** cuando el dragón se hace su **primera cicatriz** o **desobedece por primera vez**, ¿el jugador reacciona ("¡no!", una pausa)? Si sí, el corazón del juego funciona. **Ese es el objetivo del MVP**, no la cantidad de contenido.

---

## Dirección técnica

- **Motor:** Godot 4.2+ · **2D** (decisión tomada: indie, barato, encaja con minijuegos de plataformas). 3D = posible escala futura, no MVP.
- **Unicidad procedural:** el spike `godot-b1-spike/` la resuelve dibujando cada dragón por código desde un genoma. En producción, el equivalente barato es sprites modulares + shader de tinte + capas de cicatrices.

---

## Cómo arrancar a construir

1. **Corré B1** (`godot-b1-spike/`, ver su README) y cerrá `B1-Spike-nota.md`. Si el proto tira errores, arreglalos (no lo pudo correr quien lo escribió) y anotalo en el registro.
2. Leé `C1-Backlog-MVP.md`. El **vertical slice** mínimo está marcado ahí (US-01, 03, 04, 05, 06, 08, 09, 11, 13).
3. Expandí cada US con la skill `us-generator` si querés detalle de implementación (opcional).
4. Construí en el orden: `PROC → CRIA → CUIDADO → VINCULO → ENTREN → CONTROL → BIO → ECON → MUERTE`.
5. Registrá tus asunciones a medida que avanzás (`Registro-Decisiones-IA.md`).

### Convenciones de proyecto (Godot)

- **El juego va en un proyecto Godot nuevo**, separado del spike. Sugerencia: `game/` (el spike `godot-b1-spike/` es **descartable** — referencia, no base de producción; podés portar de él la generación procedural del dragón).
- **Godot 4.2+**, GDScript (podés sumar C# si lo justificás y lo anotás).
- Estructura sugerida dentro de `game/`: `scenes/`, `scripts/`, `resources/` (para los datos del dragón como `Resource`), `assets/`, `shaders/`. Ajustala si tenés una mejor y la anotás.
- **Modelá el dragón según las 4 capas de A2** como estructura de datos persistible (guardar/cargar local para el MVP).
- Mantené el **vínculo oculto en números** (A3/D2): nunca lo muestres como barra; exponelo por conducta y frases.

## NO construir en el MVP *(diseñado pero diferido)*

PvP y apuestas · legado generacional / crías / mentoría · genética/herencia · pociones de longevidad · revivir · adiestrador · composición elemental · app companion móvil · envejecimiento completo (12 meses) · dinero real / tienda.

## Definición de Hecho del MVP

El MVP está "hecho" cuando:
- [ ] El **vertical slice** de C1 corre: nace un dragón único, lo cuidás, lo entrenás en un minijuego, y **la fidelidad de control cambia con el vínculo/condición**.
- [ ] El vínculo se comunica **solo por conducta/frases** (cero barras numéricas).
- [ ] El dragón puede hacerse su **primera cicatriz** (con recuerdo) y **puede morir** (permadeath + memorial).
- [ ] En una prueba con alguien, la **primera cicatriz o la primera desobediencia genera una reacción emocional**. ← el criterio real de éxito.
- [ ] Todas las asunciones/números están en `Registro-Decisiones-IA.md`.

---

## Riesgos y cabos sueltos conocidos

- **B1 sin correr:** la premisa 2D está *asumida*, no *validada*. Es la primera tarea.
- **Números sin tunear:** todo el balance (costos, faucets, curvas, escala de edad) es conceptual; el tuning es post-MVP con datos.
- **Tensión pay-to-win (futuro):** vender huevos/clones por dinero real es aceptable (hay que criarlos); una futura **mejora genética** paga sería P2W real → mantener acotada o fuera.
- **Bonus por matar en PvP:** viable solo porque el PvP es **pactado** (consensuado). No habilitar PvP no consensuado sin repensar esto.

---

## Cómo trabajó este proyecto (convención)

Se diseñó con un pipeline de **compuertas**: cada spec cierra con *Decisiones resueltas*, *Impactos aguas abajo* y una *Definición de Hecho*. Si cambiás una decisión aguas arriba, **marcá la propagación** explícitamente (como hizo A6 con A1), no reescribas en silencio. `Plan-de-Iteraciones.md` tiene el tablero de estado y las reglas de propagación.

---

## Glosario (términos que vas a ver en los specs)

- **Genotipo / Fenotipo / Biografía / Vínculo** — las **4 capas** del dragón (A2). Genotipo = potencial heredado fijo; Fenotipo = lo que es ahora (stats + condición + edad); Biografía = log de lo vivido; Vínculo = la relación con el jugador.
- **`stat_efectivo`** — lo que el dragón realmente rinde: `valor_expresado × condición × modificadores_biografía`, acotado por edad (A2).
- **Condición física** — el "estado de forma"; decae con el abandono, se recupera con cuidado (pilar 4).
- **Obediencia imperfecta** — das una intención/input y el dragón responde con un *bucket*: acata / a medias / duda / ignora / desvía / se rebela (A3). En combate = **fidelidad de los mandos** (A7).
- **Confianza / Respeto / Apego** — los 3 ejes del vínculo (A3), **ocultos**, leídos por conducta.
- **Fidelidad de control** — el hook: cuán fielmente el dragón responde a tus inputs en tiempo real, según vínculo + condición (A7).
- **Ventanas de desarrollo** — etapas de edad donde el temperamento es moldeable; cierran "duro" (A5).
- **Etiquetas emergentes** — Protector, Tímido, Fiera, etc.: **no se eligen, emergen** de los 8 ejes de temperamento + biografía (A5).
- **Legado generacional** — continuidad tras la muerte: criar al sucesor en paralelo y que el viejo lo mentoree (A6). *Fuera del MVP.*
- **PvP pactado** — peleas consensuadas (1v1/NvN); no hay encuentros forzados con otros jugadores (E1). *Fuera del MVP.*
- **Monedas / Créditos** — moneda del juego (se gana jugando) vs. moneda de dinero real (solo cosmético/conveniencia) (E1).
- **Veterinario / Adiestrador** — servicios pagos (Monedas) para leer salud/temperamento; su necesidad **decae** con el tiempo de crianza (A4/A5).
- **Track A'** — el conjunto de sistemas **diferidos** (genética, herencia, linaje, mutaciones, composición elemental). No es del MVP.
