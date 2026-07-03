# Registro de Decisiones y Asunciones de la IA
### Bitácora de desarrollo · Drablock

> **Para qué es esto:** este documento lo mantiene **la IA que desarrolla el juego**. Cada vez que tomes una decisión que **no** está explícita en los specs, o hagas una **asunción** para poder avanzar, **anotala acá** antes de seguir. Así el dueño del proyecto puede revisar todo lo que se decidió sin tu conversación, y cualquier agente futuro entiende por qué el código es como es.

---

## Reglas (cuándo anotar)

Anotá una entrada **siempre** que:
1. **Asumas** algo que los specs no dicen (un valor, una regla, un comportamiento por defecto).
2. **Elijas** entre varias opciones válidas sin que el dueño lo haya decidido.
3. **Te desvíes** de lo que dice un spec (con su justificación — debería ser raro).
4. **Fijes un número** (los specs dicen "números a tuning": toda cifra que pongas es una asunción).
5. **Resuelvas una ambigüedad** o contradicción entre documentos.
6. **Dejes algo a medias / stub** que habrá que completar.

**No** hace falta anotar decisiones triviales de implementación (nombre de una variable, estructura de una carpeta) salvo que sienten un precedente importante.

## Formato

Agregá una fila a la tabla. IDs correlativos `D-NNN`. Marcá `Validar con dueño` = **Sí** cuando la decisión afecta diseño/experiencia (no solo implementación) y convendría confirmarla.

| ID | Fecha | Doc/US afectado | Decisión o asunción | Por qué | Reversible | Validar con dueño |
|----|-------|-----------------|---------------------|---------|-----------|-------------------|
| D-001 | 2026-07-02 | A6 / escala de edad | Vida natural del dragón ≈ **12 meses reales**. | Propuesta de la IA; el dueño la aceptó "por ahora". Es provisional. | Sí | Sí |
| D-002 | 2026-07-02 | B1 / dimensión | El MVP es **2D** (no 3D como el GDD). | Decisión del dueño (indie, barato, encaja con minijuegos). | Sí (coste alto) | Confirmado |
| D-003 | 2026-07-02 | B1 / spike | El proto-dragón se dibuja **por código con primitivas** (sin assets). | No había Godot ni arte disponibles al crearlo; prueba la variación paramétrica. Es **placeholder**, no el arte final. | Sí | Sí |
| D-004 | 2026-07-02 | B1 / código | El código del spike **no fue ejecutado** por quien lo escribió (sin Godot en el entorno). | Puede tener errores de runtime a corregir en el primer play. | — | — |
| D-005 | _(ejemplo)_ | E1 / US-19 | _(cuando pongas el primer costo concreto de comida, anotalo acá)_ | Los specs dejan los números para tuning. | Sí | Sí |

> Borrá la fila D-005 cuando cargues tu primera decisión real; está solo para mostrar el formato.

---

## Preguntas abiertas para el dueño *(acumulá acá lo que convenga consultar)*

- **B1:** ¿la premisa de unicidad procedural en 2D se sostuvo al correr el spike? (cerrar `drablock/B1-Spike-nota.md`).
- _(agregá acá cualquier duda que no puedas resolver desde los specs y que cambie el diseño)_
