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

**B1 · Spike de estilo + motor** *(reorientado a 2D)*
- *Objetivo:* confirmar en la práctica la premisa que sostiene todo — "la unicidad procedural es barata en **2D modular**". *(El plan original decía 3D; se decidió **2D en Godot** para el MVP: indie, más barato, encaja con los minijuegos de plataformas de A7/E1. Un salto a 3D queda como decisión de escala posterior.)*
- *Entregable:* mini-prototipo en Godot 4 (**`godot-b1-spike/`** — 12 dragones únicos generados por código, 0 assets) + nota de conclusión (`B1-Spike-nota.md`).
- *Definición de Hecho:* varias variaciones perceptibles, **+** una conclusión escrita: ¿la premisa se sostiene, sí o no? Si no, se replantea estilo/motor antes de seguir. **La conclusión requiere correr el prototipo (Godot local); no se puede cerrar sin ese run.**
- *Depende de:* A2.

### Track C — Construcción del MVP (solo con el núcleo aprobado)

**C1 · Backlog del MVP**
- *Objetivo:* traducir el diseño validado a trabajo ejecutable.
- *Entregable:* lista ordenada de historias de usuario con IDs + criterios de aceptación.
- *Definición de Hecho:* backlog generado con tus skills `us-backlog` (listado ordenado) → `us-generator` (cada US escrita), cubriendo *solo* el alcance MVP del GDD (un dragón, un recinto, cuidado diario, obediencia imperfecta, primera cicatriz, posibilidad de pérdida).
- *Depende de:* A1–A6 aprobados **+** B1.

**C2+ · Incrementos jugables**
- Se definen al armar el backlog en C1. Se construyen por incrementos revisables, cada uno con su propia compuerta.

### Track E — Economía *(agregado tras A4; antes estaba fuera de alcance)*

Nació como notas dispersas en A1–A5 y creció hasta necesitar diseño propio: doble moneda, apuestas de PvP, y una familia de **sinks** (reencarnación, poción de longevidad, veterinario escalonado, **adiestrador**, medicamentos, item carísimo de limpieza de traumas, IA de resumen).

**E1 · Sistema económico (monedas, créditos, fuentes y sinks)**
- *Objetivo:* diseñar la economía completa como un sistema coherente, no como notas sueltas.
- *Entregable:* spec (`.md`) con el mapa de fuentes ↔ sinks y las reglas de balance conceptual.
- *Definición de Hecho:* definidas las **dos monedas** (monedas in-game vs. créditos) con su rol; **fuentes** de cada una; **sinks** catalogados (reencarnación, revivir, longevidad, veterinario x4 niveles, medicamentos, limpieza de traumas, apuestas); la **curva de dependencia del veterinario** (decae con el tiempo de crianza); y postura sobre **dinero real** (¿se compran monedas/créditos?, ¿qué sí y qué no?).
- *Depende de:* A1 (decisiones de permadeath/PvP/doble moneda). **Se nutre de** A2, A3, A4, A6, A7 (cada uno aporta sus sinks). Conviene cerrarlo **después de A7** para tener todos los sinks a la vista.

---

## Tablero de estado

Marcá el estado a medida que avanzamos. Estados: `Pendiente` · `En curso` · `En revisión` · `Aprobado`.

| ID | Iteración | Track | Entregable | Depende de | Estado |
|----|-----------|-------|------------|------------|--------|
| A1 | Pilares / constitución | A | Doc 1 pág | — | Aprobado |
| A2 | Modelo del dragón (4 capas) | A | Spec `.md` | A1 | Aprobado |
| A3 | Vínculo + obediencia imperfecta | A | Spec + diagrama | A2 | Aprobado |
| A4 | Biografía (cicatrices/dieta/clima/batalla) | A | Spec `.md` | A2 | Aprobado |
| A5 | Personalidad + crianza | A | Spec `.md` | A2, A3 | Aprobado |
| A6 | Ciclo de vida y muerte | A | Spec `.md` | A2, A3, A4 | Aprobado |
| A7 | Sistema de batalla (núcleo) | A | Spec + diagrama | A2, A3, A5 | Aprobado |
| B1 | Spike estilo + motor (**2D**) | B | Prototipo + nota | A2 | En revisión |
| E1 | Sistema económico (monedas/créditos, sinks) | E | Spec `.md` | A1 (se nutre de A2–A7) | Aprobado |
| C1 | Backlog del MVP | C | US + criterios | A1–A7, E1, B1 | En revisión (borrador, provisional sobre B1) |
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

> **Nota (por A6):** A6 diseñó el **legado generacional** — la capa emocional de mentoría (co-crianza en paralelo, pasar virtudes/defectos, morir solo vs. dejar sucesor). Eso **abre la puerta** a crías/huevos, pero las **reglas genéticas de herencia** siguen en este Track A' diferido: A6 define el loop de vínculo, no qué stats pasan de padre a cría.

Del lado del combate, **A7 diseña solo el núcleo del sistema de batalla**. Quedan downstream, para planificar después: el **contenido PvE** (encuentros, amenazas al santuario), que se planifica junto con el MVP según la decisión abierta en A7; y el **PvP de exhibición**, endgame opcional sujeto a la decisión de PvP en A1 y a la advertencia del GDD de que el PvP competitivo tiende a matar el apego.

---

## Estado y handoff

**Toda la planificación está cerrada:** A1–A7 (núcleo) y E1 (economía) aprobados. Falta solo:
1. **Correr B1** (`godot-b1-spike/`) y escribir la conclusión en `B1-Spike-nota.md` — validar la premisa 2D.
2. **Confirmar C1** (backlog del MVP) una vez aprobado B1.
3. **Construir el MVP** siguiendo `C1-Backlog-MVP.md`.

El proyecto está preparado para levantarse en frío: ver **`CLAUDE.md`** (en este directorio, raíz del repo), que orienta a cualquier agente/desarrollador que continúe. Ahí está el mapa de archivos, el juego en 60 segundos, la dirección técnica, el orden de construcción y los cabos sueltos.
