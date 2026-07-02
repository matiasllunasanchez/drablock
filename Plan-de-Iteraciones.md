# Plan de iteraciones — Juego de crianza y vínculo con dragones
### Documento de proceso (v0.1) · *companion de* `GDD-Dragones-Vinculo.md`

> **Qué es esto:** el plan para *construir el diseño por partes*, no el diseño en sí. Convierte el GDD monolítico en un pipeline con compuertas: cada iteración produce un entregable chico y revisable, vos das feedback en la compuerta, y recién ahí avanzamos.
>
> **Qué NO es esto:** desarrollo. Ningún peldaño arranca hasta que abras la compuerta anterior. Este documento solo planifica.

---

## Principio de trabajo

Nada entra borrador y sale terminado. Cada iteración sigue el mismo ciclo, que es el mismo que ya usás en tu flujo de trabajo:

**Objetivo → Entregable → Compuerta (Definición de Hecho) → tu feedback → avanzar o ajustar**

En cada compuerta tenés tres salidas posibles:
- **Aprobar** → se avanza al siguiente peldaño.
- **Pedir cambios** → se itera el mismo entregable sin avanzar.
- **Tocar una decisión de un pilar** → puede obligar a revisitar peldaños ya cerrados (ver *Propagación de cambios*). Es intencional: es lo que te deja ajustar el proceso sin arrastrar decisiones viejas.

---

## Convenciones de proceso *(defaults propuestos — confirmá o cambiá)*

Estas tres definiciones fijan *cómo* corremos el pipeline. Dejo un default razonable en cada una; son ajustables en cualquier momento.

| Decisión de proceso | Default propuesto | Alternativas |
|---|---|---|
| **Formato de entregable** | Mezcla según el peldaño: specs → archivo `.md` versionado; discusiones cortas → inline en el chat. | Todo inline · Todo en `.md` |
| **Granularidad de los loops** | Como están propuestos abajo (un peldaño = un sistema). | Más finos (partir cada sistema) · Más gruesos (agrupar) |
| **Punto de arranque** | Peldaño **A1 (Pilares)** — es el filtro de todo lo demás. | Empezar por A2 (Modelo) o A3 (Vínculo) |

---

## El pipeline

Tres tracks. El **A** es donde se decide el juego y por donde arrancamos. El **B** valida la premisa técnica. El **C** recién existe cuando el núcleo está aprobado.

### Track A — Diseño del núcleo

**A1 · Pilares / constitución de diseño**
- *Objetivo:* fijar los innegociables y cerrar las decisiones abiertas.
- *Entregable:* documento de 1 página.
- *Definición de Hecho:* pilares escritos (vínculo > combate, unicidad por biografía, vínculo negociado) **+** postura definida sobre **permadeath** (¿canon o dificultad opt-in?) y **PvP** (¿endgame o descartado?) **+** confirmado por vos.
- *Depende de:* nada. **Es el primero.**

**A2 · Modelo del dragón (4 capas)**
- *Objetivo:* bajar Genotipo → Fenotipo → Biografía → Vínculo a un spec concreto.
- *Entregable:* spec técnico del modelo (`.md`).
- *Definición de Hecho:* qué atributos viven en cada capa, qué es heredable vs. mutable, y cómo se relacionan las capas — sin ambigüedad.
- *Depende de:* A1.

**A3 · Sistema de vínculo + obediencia imperfecta** *(el corazón)*
- *Objetivo:* modelar la relación como gameplay, no como barra.
- *Entregable:* spec detallado + diagrama de estados de la relación.
- *Definición de Hecho:* ejes del vínculo definidos (confianza/respeto/apego), modelo de "obediencia efectiva", y 3-4 casos de ejemplo que muestren perfiles distintos (quiere pero no respeta, etc.).
- *Depende de:* A2.

**A4 · Biografía** (cicatrices + cambios por dieta/clima/batalla)
- *Objetivo:* especificar la capa que vuelve único al dragón.
- *Entregable:* spec (`.md`).
- *Definición de Hecho:* catálogo de eventos que dejan marca, cómo se registran **con su recuerdo asociado**, y reglas de permanencia (qué es irreversible).
- *Depende de:* A2.

**A5 · Personalidad + crianza**
- *Objetivo:* el puente entre genes y comportamiento final.
- *Entregable:* spec (`.md`).
- *Definición de Hecho:* ejes de temperamento, cómo la genética fija el rango y la crianza el punto, ventanas de desarrollo, y cómo emergen las etiquetas (protector, tímido, etc.).
- *Depende de:* A2, A3.

**A6 · Ciclo de vida, envejecimiento y muerte** *(el arco emocional)*
- *Objetivo:* diseñar la pérdida para que duela con sentido, no sea game over.
- *Entregable:* spec (`.md`).
- *Definición de Hecho:* etapas del ciclo, ganancias/pérdidas de la vejez, la muerte como evento anticipado, y el sistema de memorial/legado.
- *Depende de:* A2, A3, A4.

**A7 · Sistema de batalla (núcleo)** *(combate como expresión del vínculo, no como stat-check)*
- *Objetivo:* diseñar *cómo* se pelea. Sigue subordinado al pilar "vínculo > combate", pero deja de ser un efecto disperso y pasa a ser un sistema propio de primera.
- *Entregable:* spec (`.md`) + diagrama de flujo de un encuentro.
- *Definición de Hecho:* paradigma de combate definido (tiempo real vs. por turnos vs. por comandos/intención); cómo entra la **obediencia imperfecta** en batalla (das intenciones, el dragón puede o no ejecutarlas según confianza/personalidad/ánimo); cómo juegan los **elementos y sus combinaciones**; cómo la **personalidad** dicta autonomía y estilo de pelea; y cómo la batalla **retroalimenta** biografía (cicatrices, agresión) y vínculo (respeto si peleó bien a tu lado, confianza si lo pusiste en peligro).
- *Depende de:* A2, A3, A5.

> **Decisión abierta (afecta el MVP):** ¿el MVP incluye un encuentro de batalla mínimo para demostrar el hook "combate como expresión del vínculo", o se queda solo con amenaza/peligro (herida, enfermedad) sin combate completo? La respuesta cambia el alcance de C1.

### Track B — Validación técnica (intercalable tras A2)

**B1 · Spike de estilo + motor**
- *Objetivo:* confirmar en la práctica la premisa que sostiene todo — "la unicidad procedural es barata en 3D modular".
- *Entregable:* mini-prototipo (1 dragón modular en Godot con variación por shader/morphs) + nota de conclusión.
- *Definición de Hecho:* un dragón mostrando varias variaciones perceptibles, **+** una conclusión escrita: ¿la premisa se sostiene, sí o no? Si no, se replantea estilo/motor antes de seguir.
- *Depende de:* A2.

### Track C — Construcción del MVP (solo con el núcleo aprobado)

**C1 · Backlog del MVP**
- *Objetivo:* traducir el diseño validado a trabajo ejecutable.
- *Entregable:* lista ordenada de historias de usuario con IDs + criterios de aceptación.
- *Definición de Hecho:* backlog generado con tus skills `us-backlog` (listado ordenado) → `us-generator` (cada US escrita), cubriendo *solo* el alcance MVP del GDD (un dragón, un recinto, cuidado diario, obediencia imperfecta, primera cicatriz, posibilidad de pérdida).
- *Depende de:* A1–A6 aprobados **+** B1.

**C2+ · Incrementos jugables**
- Se definen al armar el backlog en C1. Se construyen por incrementos revisables, cada uno con su propia compuerta.

---

## Tablero de estado

Marcá el estado a medida que avanzamos. Estados: `Pendiente` · `En curso` · `En revisión` · `Aprobado`.

| ID | Iteración | Track | Entregable | Depende de | Estado |
|----|-----------|-------|------------|------------|--------|
| A1 | Pilares / constitución | A | Doc 1 pág | — | Pendiente |
| A2 | Modelo del dragón (4 capas) | A | Spec `.md` | A1 | Pendiente |
| A3 | Vínculo + obediencia imperfecta | A | Spec + diagrama | A2 | Pendiente |
| A4 | Biografía (cicatrices/dieta/clima/batalla) | A | Spec `.md` | A2 | Pendiente |
| A5 | Personalidad + crianza | A | Spec `.md` | A2, A3 | Pendiente |
| A6 | Ciclo de vida y muerte | A | Spec `.md` | A2, A3, A4 | Pendiente |
| A7 | Sistema de batalla (núcleo) | A | Spec + diagrama | A2, A3, A5 | Pendiente |
| B1 | Spike estilo + motor | B | Prototipo + nota | A2 | Pendiente |
| C1 | Backlog del MVP | C | US + criterios | A1–A7, B1 | Pendiente |
| C2+| Incrementos jugables | C | (a definir en C1) | C1 | Pendiente |

---

## Propagación de cambios

Los peldaños tienen dependencias reales, así que un cambio aguas arriba puede invalidar trabajo aguas abajo. Esto es feature, no bug — te deja cambiar de opinión sin quedarte con specs incoherentes.

- Tocar **A1 (Pilares)** puede impactar *cualquier* peldaño posterior.
- Tocar **A2 (Modelo)** impacta A3–A7, B1 y C1.
- Tocar **A3 (Vínculo)** impacta A5, A6, A7 y el diseño del MVP.
- Tocar **A5 (Personalidad)** impacta A7 (autonomía y estilo de pelea en combate).

Cuando un cambio propague, lo marco explícitamente ("esto obliga a revisitar A4") en vez de rehacer en silencio.

---

## Fuera de alcance de este plan (por ahora)

Genética/herencia/linaje, árboles familiares, mutaciones raras y el sistema elemental composicional **no se planifican todavía**. Están diseñados en el GDD, pero especificarlos ahora sería trabajo en riesgo: dependen de que el núcleo (A1–A7) esté validado. Entran a este plan como un Track A' recién cuando lleguemos.

Del lado del combate, **A7 diseña solo el núcleo del sistema de batalla**. Quedan downstream, para planificar después: el **contenido PvE** (encuentros, amenazas al santuario), que se planifica junto con el MVP según la decisión abierta en A7; y el **PvP de exhibición**, endgame opcional sujeto a la decisión de PvP en A1 y a la advertencia del GDD de que el PvP competitivo tiende a matar el apego.

---

## Próximo paso

Confirmá las tres **convenciones de proceso** (o aceptá los defaults) e indicá el punto de arranque. Con eso, abrimos la primera iteración.
