# C1 · Backlog del MVP
### Entregable de la iteración C1 (v0.1 · **borrador, provisional sobre B1**) · *parte de* `Plan-de-Iteraciones.md` · Track C

> **Qué es esto:** la traducción del diseño (A1–A7 + E1) a **trabajo ejecutable**: épicas y una lista **ordenada** de historias de usuario (US) con criterios de aceptación, acotada al **MVP**.
>
> **Provisional:** C1 depende de B1 aprobado. B1 está *En revisión* (falta correr el prototipo). Si el spike revela algo, ajustar la épica **PROC**.
>
> **Siguiente paso sugerido para quien construya:** expandir cada US con la skill `us-generator` (frontend/backend, reglas, DoD por US). Acá van los **seeds ordenados** (estilo `us-backlog`).

---

## Alcance del MVP *(qué SÍ)*

Un loop individual, en **2D (Godot 4)**, de **un** jugador con **un** dragón:
1. Nace **un dragón** (genoma procedural del spike B1).
2. Vive en **un espacio de cuidado** (recinto).
3. **Cuidado diario:** alimentar, mantener la condición física (que decae).
4. **Entrenamiento vía un minijuego** que da **Monedas** y mejora skills por uso.
5. **Obediencia imperfecta = fidelidad de control** visible en el minijuego (el hook central).
6. **Vínculo** que se lee por **conducta** (frases cualitativas) + veterinario básico pago.
7. **Biografía:** primera **cicatriz** por un evento.
8. **Posibilidad de pérdida:** el dragón puede **morir** (permadeath), con **memorial**; podés criar otro.

## Fuera del MVP *(qué NO — no construir todavía)*

PvP (práctica y a muerte), apuestas, legado generacional / crías / mentoría, genética/herencia, pociones de longevidad, revivir, adiestrador, composición elemental, app companion móvil, envejecimiento completo de 12 meses, dinero real / tienda. *(Todo diseñado, pero diferido — ver specs y Track A'.)*

---

## Épicas (ordenadas por dependencia)

| # | Épica | Qué cubre | Depende de |
|---|-------|-----------|------------|
| PROC | Dragón procedural | Genoma → dragón 2D dibujado (del spike B1) | B1 |
| CRIA | Dragón y recinto | Instanciar el dragón, su estado, el espacio | PROC |
| CUIDADO | Cuidado diario | Alimentar, condición física que decae, ánimo | CRIA |
| VINCULO | Vínculo y lectura | Ejes internos, frases de conducta, veterinario básico | CRIA |
| ENTREN | Entrenamiento (minijuego) | Minijuego de leveleo, faucet de Monedas, progresión por uso | CRIA |
| CONTROL | Fidelidad de control | Obediencia imperfecta como fiabilidad de mandos en el minijuego | ENTREN, VINCULO |
| BIO | Biografía | Log de eventos, **primera cicatriz**, bitácora leíble | CUIDADO, ENTREN |
| MUERTE | Pérdida y memorial | Permadeath por descuido/evento, memorial, criar otro | CUIDADO, BIO |
| ECON | Economía básica | Monedas (faucet minijuego, sinks comida/veterinario) | ENTREN, CUIDADO |

---

## Historias de usuario (seeds ordenados)

### Épica PROC — Dragón procedural
- **US-01 · Generar un dragón desde una semilla.** Como jugador quiero que mi dragón se genere proceduralmente para que sea único.
  - AC: una semilla produce siempre el mismo dragón; el genoma cubre color/elemento, tamaño, partes (alas, cuernos, cola, púas); dos semillas distintas se ven perceptiblemente distintas.
  - *Base: `godot-b1-spike/DragonSpecimen.gd`.*
- **US-02 · Renderizar el dragón en escena con estados visuales.** 
  - AC: se dibuja en el recinto; soporta capas para cicatrices (BIO) y variación de ánimo/condición (tinte/postura).

### Épica CRIA — Dragón y recinto
- **US-03 · Espacio de cuidado (recinto).** 
  - AC: escena 2D donde vive el dragón; puntos de interacción (comida, entrenar, veterinario); el dragón está presente y "vivo" (idle animado/animable).
- **US-04 · Modelo de datos del dragón (4 capas de A2).** 
  - AC: genotipo (rangos), fenotipo (stats expresados + condición + edad), biografía (log), vínculo (ejes); persistencia local (guardar/cargar).

### Épica CUIDADO — Cuidado diario
- **US-05 · Alimentar al dragón.** 
  - AC: cuesta Monedas; sube condición/ánimo; comida preferida da un plus (semilla de biografía/apego).
- **US-06 · Condición física que decae con el tiempo (pilar 4).** 
  - AC: la condición baja con el tiempo real / inactividad; recuperable con cuidado; modula el `stat_efectivo` (A2). *Atrofia por edad = fuera de MVP.*
- **US-07 · Ánimo transitorio.** 
  - AC: hambre/descanso/actividad reciente mueven el ánimo; el ánimo se lee por conducta (VINCULO) y afecta el control (CONTROL).

### Épica VINCULO — Vínculo y lectura
- **US-08 · Ejes de vínculo (Confianza/Respeto/Apego).** 
  - AC: valores internos **ocultos**; suben/bajan según cuidado y entrenamiento (reglas de A3, simplificadas).
- **US-09 · Lectura cualitativa por conducta (A3/D2).** 
  - AC: el juego nunca muestra números; muestra frases ("te busca", "inquieto") y conducta observable coherentes con los ejes.
- **US-10 · Veterinario básico (pago, dependencia decreciente).** 
  - AC: pagando Monedas se obtiene una **bitácora resumida**; el costo/necesidad baja con el tiempo de crianza (curva de A4, versión mínima).

### Épica ENTREN — Entrenamiento (minijuego)
- **US-11 · Minijuego de entrenamiento (plataformas simple).** 
  - AC: un nivel jugable; controlás al dragón; completar/objetivos otorga **Monedas** (faucet de E1).
- **US-12 · Progresión por uso.** 
  - AC: usar mucho una capacidad (movilidad / un poder) la mejora y desbloquea una variante; se registra en biografía (A7).

### Épica CONTROL — Fidelidad de control *(el hook)*
- **US-13 · Obediencia imperfecta como fiabilidad de mandos (A7).** 
  - AC: con vínculo/condición bajos, los inputs fallan (se ignoran, se retrasan, se recortan: vuela poco / dash corto); con Confianza alta el control es 1:1. **Se siente en las manos.**
- **US-14 · Feedback de por qué falla el control.** 
  - AC: señales sutiles (el dragón duda, se distrae) coherentes con vínculo/ánimo; sin tutorial explícito de números.

### Épica BIO — Biografía
- **US-15 · Log de biografía (append-only) + consolidación.** 
  - AC: eventos se registran; los chicos se agrupan (digest "entrenamiento semanal"); los significativos quedan sueltos (A4).
- **US-16 · Primera cicatriz.** 
  - AC: un evento (percance de entrenamiento o amenaza) deja una **cicatriz visual permanente** + entrada de biografía con recuerdo; se ve en el dragón (US-02).

### Épica MUERTE — Pérdida y memorial
- **US-17 · Permadeath por descuido/evento.** 
  - AC: descuido extremo (condición al piso) o un evento peligroso puede matar al dragón; la muerte es **real y anticipada** (señales previas). *Muerte por vejez = fuera de MVP.*
- **US-18 · Memorial + criar otro.** 
  - AC: al morir, su **bitácora se preserva** (salón de memorias); el jugador puede **criar otro** dragón (vuelve a US-01).

### Épica ECON — Economía básica
- **US-19 · Moneda del juego (Monedas) con faucet y sinks.** 
  - AC: se ganan en el minijuego (US-11); se gastan en comida (US-05) y veterinario (US-10); balance grueso (números = tuning post-MVP).

---

## Definición de Hecho (de la iteración C1)

- [x] Alcance MVP y fuera-de-alcance explícitos.
- [x] Épicas ordenadas por dependencia.
- [x] US seeds ordenados con criterios de aceptación base.
- [ ] **B1 aprobado** (pendiente del run del spike) — condición formal del plan.
- [ ] Expansión de cada US con `us-generator` (tarea de quien construya).
- [ ] **Confirmado por vos.**

---

## Orden de construcción recomendado (para Fable)

`PROC → CRIA → CUIDADO → VINCULO → ENTREN → CONTROL → BIO → ECON → MUERTE`

El **incremento jugable más chico que demuestra el juego** (vertical slice): **US-01, US-03, US-04, US-05, US-06, US-08, US-09, US-11, US-13**. Eso ya es "un dragón único al que cuidás y entrenás, y que te obedece imperfectamente según cómo lo tratás". Todo lo demás (biografía, muerte, veterinario) se apila encima.
