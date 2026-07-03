# A2 · Modelo del dragón (4 capas)
### Entregable de la iteración A2 (v1.0 · **Aprobado**) · *parte de* `Plan-de-Iteraciones.md`

> **Qué es esto:** el spec técnico de cómo está construido un dragón, en cuatro capas. Define qué vive en cada capa, qué se hereda vs. qué muta, y cómo se relacionan. Es la base de datos conceptual de la que dependen A3–A7, B1 y C1.
>
> **Depende de:** A1 (aprobado). **Hereda de A1:** la condición física debe ser una capa que decae con el abandono; la obediencia depende del vínculo, no de los stats.

---

## Visión general — las 4 capas

Un dragón no es un objeto plano: es **cuatro capas apiladas**, de lo más fijo a lo más vivo.

| # | Capa | Una línea | Muta en juego | Vive en |
|---|------|-----------|---------------|---------|
| 1 | **Genotipo** | Lo que *podría* ser: potencial heredado. | ❌ Nunca | El dragón (fijo al nacer) |
| 2 | **Fenotipo** | Lo que *es ahora*: expresión + condición actual. | ✅ Constante | El dragón (estado vivo) |
| 3 | **Biografía** | Lo que *le pasó*: historia y marcas. | ✅ Solo suma | El dragón (registro) |
| 4 | **Vínculo** | Lo que *es con vos*: la relación de esta díada. | ✅ Constante | La díada jugador↔dragón |

**Regla de flujo:** Genotipo fija los **límites** → Fenotipo expresa un **punto** dentro de esos límites → Biografía **empuja o traba** ese punto con lo vivido → Vínculo decide **cuánto de ese potencial se traduce en obediencia efectiva**.

```
GENOTIPO          FENOTIPO             BIOGRAFÍA           VÍNCULO
(rango fijo)  →   (valor actual)   ←   (marcas/recuerdos)  (confianza/respeto/apego)
  techo/piso      condición física       cicatrices            │
  elemento        stats expresados       eventos permanentes   ▼
  predisposición  temperamento actual                    OBEDIENCIA EFECTIVA
                                                     = cuánto del fenotipo
                                                       realmente responde
```

---

## Capa 1 · Genotipo *(heredable · inmutable)*

Lo que el dragón trae al nacer. **No cambia nunca** en toda su vida. Es lo único que se hereda por linaje (el sistema de herencia en sí está fuera de alcance por ahora — acá solo definimos *qué* es heredable).

Contiene:
- **Envoltorio de atributos de por vida** — para cada stat (fuerza, resistencia, velocidad, agilidad, potencia elemental, etc.), un **piso y un techo** genéticos que valen para *toda la vida*. El dragón nunca superará su techo genético por más que entrene. Ejemplo: `agilidad ∈ [30, 80]`. **Importante:** este envoltorio es el máximo teórico de por vida; la **edad** decide qué parte del envoltorio está *alcanzable ahora* (ver Capa 2 → Edad).
- **Elemento base** — la afinidad elemental con la que nace. *(El sistema composicional de elementos está fuera de alcance; acá el elemento es solo un identificador heredable.)*
- **Rangos de temperamento** — predisposiciones (ver A5): p.ej. `agresividad ∈ [alto]`, `sociabilidad ∈ [bajo-medio]`. La genética fija el **rango**; la crianza fija el **punto** (esto se detalla en A5).
- **Marcadores estéticos heredables** — variaciones de forma/color/patrón que alimentan la unicidad visual (conecta con B1: unicidad procedural).

> **No contiene:** ningún valor actual. El genotipo es potencial puro, nunca "estado".

---

## Capa 2 · Fenotipo *(expresión · mutable, constante)*

Lo que el dragón **es en este momento**. Es la capa que se lee para casi todo (combate, cuidado, apariencia). Se recalcula a partir del genotipo, la crianza acumulada y la condición actual.

Contiene dos sub-bloques:

**2a. Stats expresados** — el valor actual de cada atributo, siempre dentro del rango genético.
`valor_expresado = punto_entrenado (dentro del rango del genotipo)`

**2b. Condición física** *(el bloque que decae — pilar 4 de A1)* — el **estado de forma** del dragón: nutrición, descanso, tono muscular, salud. **Decae con el tiempo si el jugador no interactúa** y se recupera con cuidado/entrenamiento. Modula cuánto del stat expresado está realmente disponible.

**2c. Edad** *(el reloj — nuevo concepto, cierra en A6)* — el dragón **envejece en tiempo real, juegues o no** (como una mascota de verdad). La edad **no baja stats: redistribuye el envoltorio alcanzable**. De joven llega alto en agilidad y bajo en robustez; de viejo, el techo de agilidad baja y el de robustez sube. *"Hoy soy menos ágil pero más robusto."* El dragón **creció y cambió**, y hay que **readaptar** el entrenamiento a las capacidades nuevas.

**Stat efectivo** (lo que de verdad entra a la arena):
```
stat_efectivo = valor_expresado × modificador_condición × modificadores_biografía
   donde  valor_expresado = punto_entrenado, acotado por:
          [piso, techo]_genético  ∩  [ventana alcanzable ahora]_edad
```
- Con condición óptima, el modificador es 1.0 (rinde todo lo alcanzable).
- Con condición degradada (abandono corto), cae por debajo de 1.0 → el dragón "se debilita", pero es **recuperable con cuidado** (equivalente a dejar el gym unas semanas).
- **Cuánto entrenás sube el punto; cuánto cuidás decide si podés usarlo; la edad decide qué punto es siquiera alcanzable.**

### Edad, tiempo y transformación *(resuelve D1)*

La filosofía: **el dragón nunca "pierde stats" — cambia**, como un cuerpo que crece y envejece. Hay **dos relojes** que operan sobre el fenotipo:

1. **Reloj de acondicionamiento (actividad):** sube con cuidado/entrenamiento, baja con abandono. **Recuperable** mientras la inactividad sea corta.
2. **Reloj de edad (calendario):** avanza en tiempo real siempre. **No se recupera** — es de una sola dirección. Va corriendo la *ventana alcanzable* del envoltorio genético a lo largo de la vida.

**La atrofia depende de cuánto se cruzan los dos relojes:**

| Inactividad | Efecto | ¿Reversible? |
|---|---|---|
| Corta (días–pocas semanas) | Baja la condición física. | ✅ Totalmente recuperable con cuidado. |
| Media, sin cruzar cambio de etapa | Baja condición + empieza desacondicionamiento del punto entrenado. | ✅ Recuperable, cuesta más re-entrenar. |
| Larga, cruzando una etapa de edad | El dragón **envejeció mientras no estabas**: la ventana alcanzable se corrió. Capacidades viejas ya no vuelven **igual**; hay que entrenar **otras** que ahora sí están altas. | ⚠️ **Transformación, no pérdida.** Se readapta a un dragón distinto. |

> **Propuesta de escala de edad (provisoria — se cierra en A6):** el dragón envejece en **tiempo real de calendario**. Etapas propuestas, con vida natural ≈ 12 meses reales de existencia:
> | Etapa | Tiempo real transcurrido | Perfil del envoltorio |
> |---|---|---|
> | Cría | 0–2 semanas | todo bajo, moldeable |
> | Juvenil | 2 sem – 2 meses | agilidad/velocidad subiendo |
> | Adulto joven | 2–4 meses | pico de agilidad, robustez media |
> | Adulto pleno | 4–8 meses | equilibrio, pico general |
> | Maduro | 8–12 meses | agilidad baja, robustez/resistencia altas |
> | Anciano | 12+ meses | declive general → muerte natural anticipada (A6) |
>
> **Decisión que te queda para A6:** ¿la escala total (meses / semanas / años equivalentes) te cierra en ~12 meses reales, o la querés más corta (más rotación de dragones) o más larga (vínculos más duraderos)?

---

## Capa 3 · Biografía *(registro · mutable, solo suma)*

Lo que le **pasó** al dragón. Es un **log de eventos** que nunca se borra (salvo reglas de permanencia que se detallan en A4). Es la capa que hace único al dragón (pilar 2 de A1).

Cada entrada de biografía tiene:
- **Evento** — qué pasó (herida en batalla, primera presa, tormenta sobrevivida, dieta prolongada, victoria/derrota en arena...).
- **Marca** — su efecto persistente sobre el fenotipo: cicatriz (visual + posible modificador), trauma o endurecimiento (temperamento), etc.
- **Recuerdo asociado** — el gancho narrativo/emocional. *(A4 lo detalla.)*

La biografía **retroalimenta** las otras capas:
- → **Fenotipo:** cicatrices y marcas aplican los `modificadores_biografía` de la fórmula de arriba.
- → **Vínculo:** eventos compartidos suben o bajan confianza/respeto/apego (p.ej. lo pusiste en peligro → confianza baja pero respeto puede subir).

> **Frontera con A4:** acá definimos *que* la biografía es un log de (evento, marca, recuerdo) que retroalimenta fenotipo y vínculo. El **catálogo** de eventos y las **reglas de permanencia** son el entregable de A4.

---

## Capa 4 · Vínculo *(relación · mutable, constante)*

Lo que el dragón **es con vos**. **No vive en el dragón como criatura, sino en la díada jugador↔dragón.** Si otro jugador tuviera el mismo dragón, el vínculo sería otro.

Contiene (ejes provisorios — A3 los cierra):
- **Confianza** — ¿me expone al peligro o me cuida?
- **Respeto** — ¿me reconoce como líder capaz?
- **Apego** — ¿le importo emocionalmente?

Su producto central es la **obediencia efectiva**: das una intención, y el vínculo (cruzado con temperamento y ánimo) decide **si el dragón la ejecuta, la ejecuta a medias, o hace otra cosa**. Esto vale en cuidado y en arena (pilar 3 de A1).

> **Frontera con A3:** acá definimos *que* el vínculo es una capa de la díada con ejes que producen obediencia efectiva. El **modelo detallado** (cómo suben/bajan los ejes, la fórmula de obediencia, los diagramas de estado) es el entregable de A3.

---

## Heredable vs. mutable — tabla maestra

| Elemento | Capa | ¿Heredable? | ¿Muta en juego? | Cómo cambia |
|---|---|---|---|---|
| Rangos de atributos (piso/techo) | Genotipo | ✅ | ❌ | Nunca |
| Elemento base | Genotipo | ✅ | ❌ | Nunca |
| Rangos de temperamento | Genotipo | ✅ | ❌ | Nunca |
| Marcadores estéticos | Genotipo | ✅ | ❌ | Nunca |
| Stat expresado (punto entrenado) | Fenotipo | ❌ | ✅ | Entrenamiento / crianza |
| Condición física | Fenotipo | ❌ | ✅ | Cuidado ↔ abandono (recuperable si es corto) |
| Edad / etapa | Fenotipo | ❌ | ✅ (una sola dirección) | Tiempo real de calendario (irreversible) |
| Temperamento expresado | Fenotipo | ❌ | ✅ (con ventanas) | Crianza + preparación de combate (ver A5) |
| Cicatrices / marcas | Biografía | ❌ | ✅ (solo suma) | Eventos vividos |
| Recuerdos | Biografía | ❌ | ✅ (solo suma) | Eventos vividos |
| Confianza / respeto / apego | Vínculo | ❌ | ✅ | Trato del jugador |

---

## Decisiones resueltas

- **D1 · Atrofia → Transformación por edad + acondicionamiento.** No se "pierden stats": el dragón cambia. Dos relojes (acondicionamiento recuperable · edad irreversible). La inactividad corta baja condición recuperable; la larga, cruzando etapas, transforma el dragón y obliga a readaptar. *(Ver Capa 2 → Edad. Escala fina se cierra en A6.)*
- **D2 · Acoplamiento combate ↔ temperamento ↔ control.** Cuanto **más preparado para luchar** está el dragón, **mayor temperamento y más difícil de controlar**. Un dragón agresivo da ventaja en la arena, pero **criarlo y mantenerlo es en sí una lucha y un sacrificio** (más atención, más riesgo de desobediencia). Los ejes finos de temperamento siguen siendo entregable de A5; A2 fija *esta relación*: `preparación_de_combate ↑ ⇒ temperamento ↑ ⇒ obediencia efectiva más exigente (necesita más vínculo)`.
- **D3 · Dueño único 1-a-1, sin transferencia (por ahora).** El vínculo es fuerte y exclusivo entre el jugador y **su** dragón. **No** se venden, entregan ni intercambian dragones. La idea de cambiar/transferir dragones queda como *posible paso a muy futuro*, fuera de alcance actual. → La muerte se resuelve por permadeath + reencarnación (A1), no por traspaso.

---

## Definición de Hecho (checklist de la compuerta)

- [x] Definidas las 4 capas y qué atributos vive cada una.
- [x] Definido qué es heredable vs. mutable (tabla maestra).
- [x] Definido cómo se relacionan las capas (regla de flujo + fórmula de stat efectivo + retroalimentación de biografía y vínculo).
- [x] Aterrizadas las decisiones de A1 (condición que decae; obediencia efectiva desde el vínculo).
- [x] Resueltas D1–D3 (transformación por edad · acoplamiento combate/temperamento · dueño único 1-a-1).
- [x] **Confirmado por vos** (aprobado 2026-07-02).

---

## Pasos a futuro *(anotado en A2, se especifica en A6 + Economía)*

### Pociones de longevidad — vida extensible indefinidamente
- Existirán **pociones caras, compradas con moneda del juego**, que **alargan la vida** del dragón.
- Encaja con la mitología: los dragones viven muchísimo → un dragón podría alcanzar **miles de años** (miles de dragón-años) si el jugador invierte en mantenerlo.
- **Función económica:** es un **sink** de moneda de alto costo (como la reencarnación), no una compra trivial.
- **Tensión con el pilar 5 (la pérdida tiene sentido y tiene precio):** poder posponer la muerte indefinidamente podría diluir el arco emocional. Se reconcilia por el **costo escalable** — mantener a un dragón milenario debe ser cada vez más caro/exigente, no gratis. **A definir en A6/Economía:** ¿el costo escala con la edad?, ¿la poción frena el envejecimiento o solo pospone la muerte natural manteniendo al dragón "anciano"?, ¿interactúa con el declive de capacidades del anciano?

---

## Impactos aguas abajo (nuevos, por A2)

- **A5 (Personalidad):** debe modelar el acoplamiento `preparación de combate ↑ ⇒ temperamento ↑ ⇒ control más difícil` (D2).
- **A6 (Ciclo de vida):** hereda el **reloj de edad** y la **escala provisoria** (~12 meses reales); debe cerrar la escala fina y las etapas, y conectar el declive del anciano con la muerte natural.
- **A3 (Vínculo):** la obediencia efectiva ahora también depende del temperamento elevado por preparación de combate.
- **Economía / PvP:** D3 confirma que no hay mercado de dragones; la única "salida" de un dragón es la muerte.
