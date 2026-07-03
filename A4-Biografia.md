# A4 · Biografía (cicatrices · dieta · clima · batalla · trauma)
### Entregable de la iteración A4 (v1.0 · **Aprobado**) · *parte de* `Plan-de-Iteraciones.md`

> **Qué es esto:** el spec de la **Capa 3 (Biografía)** de A2 — la que hace único al dragón (pilar 2). Define el **catálogo de eventos que dejan marca**, cómo se registran **con su recuerdo asociado**, y las **reglas de permanencia** (qué es irreversible).
>
> **Depende de:** A2 (aprobado). **Recibe de A3:** el **trauma de vínculo** (conductual y de capacidad) es un evento de biografía y se cataloga acá.

---

## Qué es la biografía (recap de A2)

Un **log que solo suma** (append-only): el registro **nunca se borra**. Cada cosa que le pasa al dragón entra como una entrada. Es lo que hace que dos dragones con el mismo genotipo se sientan distintos: **no por lo que son, por lo que vivieron.**

> **Distinción importante:** el log de entradas es **permanente siempre**. Lo que las *reglas de permanencia* gobiernan es si el **efecto/marca** de un evento persiste, se atenúa o se cura — **no** si el evento "pasó". Un trauma curado deja igual el registro *"esto le pasó, y lo superó"*. Eso es historia, no un stat.

---

## Anatomía de una entrada

Cada entrada de biografía tiene cinco campos:

| Campo | Qué es |
|---|---|
| **Evento** | Qué pasó (herida en batalla, tormenta, ayuno, traición...). |
| **Marca** | El efecto persistente sobre el dragón (ver *Tipos de marca*). Puede ser ninguno. |
| **Recuerdo** | El gancho narrativo/emocional. Lo que el jugador *lee* de esa entrada. |
| **Edad / fecha** | En qué etapa de vida ocurrió (cruza con el reloj de edad de A2). |
| **Intensidad** | Cuán fuerte fue (define permanencia y peso emocional). |

El **recuerdo** es la cara visible: se muestra como texto cualitativo (coherente con A3/D2, sin números), formando la **bitácora del dragón** — su historia leíble.

---

## Tipos de marca

Una entrada puede dejar (o no) una marca. Tipos:

| Tipo de marca | Efecto | Ejemplo |
|---|---|---|
| **Cicatriz visual** | Cambio estético permanente (alimenta unicidad de B1). | Garra que dejó una raya en el flanco. |
| **Modificador de fenotipo** | +/- sobre un stat efectivo (los `modificadores_biografía` de A2). | Ala mal curada → -velocidad; músculo endurecido → +fuerza. |
| **Endurecimiento** *(positivo)* | Ganancia de temperamento/resiliencia por superar adversidad. | Sobrevivió a un clima extremo → más resistente al frío. |
| **Trauma conductual** | Recelo persistente ante un tipo de situación (afecta obediencia, A3). | Tras casi morir, rechaza órdenes de alto riesgo. |
| **Trauma de capacidad** | **Bloquea un ataque/acción** que ya no puede volver a hacer (A7). | Se quemó usando una llamarada → no vuelve a usarla. |
| **Recuerdo puro** | Sin efecto mecánico; solo narrativo/emocional. | Su primera presa; el día que te eligió. |

---

## Catálogo de eventos que dejan marca

Organizado por fuente. (Balance y probabilidades: fuera de alcance de A4; acá va el *qué*, no el *cuánto*.)

### Batalla
| Evento | Marca típica | Permanencia |
|---|---|---|
| Herida grave en combate | Cicatriz visual + modificador − | Permanente-marcada |
| Casi muere / lo pusiste en peligro extremo | Trauma conductual (recelo al riesgo) + baja de confianza (A3) | Casi irreversible |
| Victoria dura peleada a tu lado | Endurecimiento + respeto (A3) | Persistente |
| Uso de un ataque que le salió muy mal | Trauma de capacidad (bloqueo de ese ataque) | Casi irreversible |
| Primera victoria | Recuerdo puro (hito) | Irreversible (por diseño) |

### Dieta / alimentación
| Evento | Marca típica | Permanencia |
|---|---|---|
| Ayuno prolongado / negligencia | Modificador − (debilidad) + baja condición | Persistente-curable |
| Dieta rica sostenida | Modificador + (desarrollo) | Persistente |
| Comida preferida recurrente | Apego (A3) + recuerdo | Efímera/acumulativa |
| Intoxicación por algo que le diste | Trauma conductual (rechaza ese alimento) | Persistente |

### Clima / ambiente
| Evento | Marca típica | Permanencia |
|---|---|---|
| Sobrevivir a clima extremo | Endurecimiento (resistencia a ese clima) | Persistente |
| Exposición prolongada dañina | Modificador − (enfermedad) | Persistente-curable |
| Ambiente favorito | Recuerdo + ánimo | Efímera |

### Cuidado / vínculo *(recibe de A3)*
| Evento | Marca típica | Permanencia |
|---|---|---|
| Traición / peligro repetido → estado **Quebrado** | **Trauma de vínculo** (conductual y/o de capacidad) | **Casi irreversible** (solo item carísimo) |
| Recuperación tras Quebrado | Recuerdo ("cicatriz que sanó") | Irreversible como registro |
| Superar una adversidad juntos | Endurecimiento + apego/respeto | Persistente |
| El día que te eligió / primer vínculo | Recuerdo puro (hito fundacional) | Irreversible |

### Hitos de vida
| Evento | Marca | Permanencia |
|---|---|---|
| Eclosión, primera presa, primer vuelo, cambio de etapa de edad | Recuerdo puro | Irreversible (jalonan la bitácora) |
| Muerte cercana de otro dragón / evento de mundo | Recuerdo puro (peso emocional) | Irreversible |

---

## Reglas de permanencia

Cinco niveles, de lo más lavable a lo imborrable. Gobiernan el **efecto**, no el registro.

| Nivel | Se quita con | Ejemplos |
|---|---|---|
| **Efímera** | Sola, con tiempo/cuidado. | Mal humor por clima, rasguño leve, ánimo. |
| **Persistente-curable** | Cuidado sostenido, tiempo, items comunes. | Herida que sana, desnutrición, enfermedad. |
| **Permanente-marcada** | El efecto se atenúa; la **cicatriz visual queda**. | Cicatriz de batalla, ala mal curada. |
| **Casi irreversible** | Solo **item muy, muy caro** (sink de A3/Economía). | Trauma de vínculo, trauma de capacidad (ataque bloqueado). |
| **Irreversible (por diseño)** | Nunca. Es identidad. | Hitos fundacionales, recuerdos de muerte, "el día que te eligió". |

> **Principio:** cuanto más define quién *es* el dragón, menos borrable. Lo mecánico se cura; lo identitario se lleva.

---

## Cómo retroalimenta las otras capas

- → **Fenotipo (A2):** las marcas de tipo *modificador* y *endurecimiento* son los `modificadores_biografía` de la fórmula de stat efectivo.
- → **Vínculo (A3):** los eventos de cuidado/traición mueven Confianza/Respeto/Apego; los traumas de vínculo entran como marca.
- → **Batalla (A7):** los traumas de capacidad **bloquean acciones**; las cicatrices modulan stats en la arena.
- → **Ciclo de vida (A6):** la biografía **es el material del memorial/legado** — cuando el dragón muere, su bitácora es lo que queda.

---

## Consolidación de eventos *(resuelve D1)*

La biografía registra internamente **muchos eventos chicos**, pero **los agrupa en entradas significativas** para que la bitácora sea legible, no ruido. Dos niveles:

- **Entrada consolidada (resumen):** los eventos menores recurrentes se compactan en un *digest* — p.ej. **"Entrenamiento y dieta de la semana"**, que resume el saldo (mejoró X, descuidó Y).
- **Detalle desplegable:** si el jugador quiere, **abre la consolidada y ve el detalle** evento por evento.

Los **eventos significativos** (herida grave, traición, hito, trauma) **no se consolidan**: entran como entrada propia, con su peso.

> Regla: lo cotidiano se agrupa; lo memorable se destaca. La bitácora se lee como una historia, no como un ledger.

---

## Marcas como trade-offs *(resuelve D2)*

Las marcas están **equilibradas entre ventajas y desventajas**, al estilo de los rasgos (traits) de *Project Zomboid* al crear un personaje: **la vida mejora algunas aptitudes y empeora otras**. No es "todo cicatriz que resta" ni "todo endurecimiento que suma".

- Con el **paso del tiempo y la edad** (conecta con la transformación de A2), muchas marcas vienen **en par**: gana robustez ↔ pierde agilidad; endurece el temperamento ↔ baja la sociabilidad.
- El jugador **cría un perfil**, no una barra que solo sube. Un dragón viejo no es "peor": es **distinto**, con su set de ventajas/desventajas ganadas.

---

## Sistema de veterinario — legibilidad de la biografía *(resuelve D3)*

Cómo el jugador **lee** el estado y la bitácora depende de un servicio pago (**monedas del juego**) que **se necesita cada vez menos a medida que criás al dragón** — igual que con una mascota real: al principio dependés del veterinario, con el tiempo ya le conocés las mañas.

**Niveles de servicio (pagando más, ves más):**
| Nivel | Costo | Qué obtenés |
|---|---|---|
| **Default (gratis)** | — | Solo **actitudes**: conducta observable (lectura cualitativa de A3). |
| **Consulta básica** | Monedas | **Bitácora pequeña** resumida (pasada por una **IA simple** que resume qué le pasa, sin obligarte al detalle). |
| **Diagnóstico detallado** | Más monedas | **Step-by-step** de qué hacer para mejorarlo + acceso al detalle desplegable de la bitácora. |
| **Tratamiento** | Monedas | Comprar **medicamentos / items** para que mejore. |

**Curva de dependencia (clave):** cuanto **más tiempo lo cuidaste vos**, más **reconocés sus actitudes por tu propia crianza** y **menos falta el veterinario**. Es un **sink de economía que arranca alto y se afloja** con el tiempo de vínculo — premia la crianza sostenida y castiga descuidar/rotar dragones.

> Conecta con A3/D2: la **inferencia por conducta** es la vía gratuita y "experta"; el veterinario es el atajo pago para cuando todavía no lo conocés.

---

## Limpieza de traumas *(resuelve D4)*

El **item de limpieza cura cualquier trauma** (incluidos los casi-irreversibles), pero es **MUY caro**, comprable con **plata del juego**.

- **Alternativa sin pagar:** con **mucho juego y esfuerzo**, el jugador puede recuperar el stat/capacidad afectada hasta **~90%**, pero **no al 100%** — el último tramo solo lo cierra el item.
- Así, la marca **casi nunca se borra del todo gratis**: o pagás, o convivís con un dragón que quedó marcado en un ~10%.

---

## Decisiones resueltas

- **D1 · Consolidación:** muchos eventos chicos → agrupados en entradas significativas (digest tipo *"entrenamiento y dieta semanal"*) con detalle desplegable; lo memorable no se consolida.
- **D2 · Trade-offs estilo Project Zomboid:** marcas equilibradas ventaja/desventaja; la vida y la edad mejoran unas aptitudes y empeoran otras.
- **D3 · Veterinario escalonado + curva de dependencia:** legibilidad paga por niveles (actitudes → bitácora IA → step-by-step → tratamiento), que se necesita menos cuanto más criaste al dragón.
- **D4 · Limpieza:** item carísimo cura cualquier trauma; sin pagar, el esfuerzo llega a ~90% pero no al 100%.

---

## Definición de Hecho (checklist de la compuerta)

- [x] Catálogo de eventos que dejan marca (batalla, dieta, clima, vínculo, hitos).
- [x] Cómo se registran, **con recuerdo asociado** (anatomía de entrada + tipos de marca).
- [x] Reglas de permanencia (5 niveles; qué es irreversible).
- [x] Integrado el **trauma de vínculo** de A3.
- [x] Resueltas D1–D4 (consolidación · trade-offs · veterinario · limpieza).
- [x] **Confirmado por vos** (aprobado 2026-07-02).

---

## Impactos aguas abajo (nuevos, por A4)

- **Economía:** nuevo sistema de **servicios de veterinario** (4 niveles, sink que decae con el tiempo de crianza) + **medicamentos/items** comprables + confirma el **item carísimo** de limpieza de traumas. Empuja a que Economía sea track propio.
- **IA de resumen:** la "consulta básica" usa una **IA simple** para resumir la bitácora — nueva pieza técnica a considerar (infra).
- **A5 (Personalidad):** los **trade-offs** de temperamento (robustez↔agilidad, dureza↔sociabilidad) deben ser coherentes con los ejes que defina A5.
- **A2 (retro):** confirma que la transformación por edad se **manifiesta como marcas de biografía** en pares ventaja/desventaja.
