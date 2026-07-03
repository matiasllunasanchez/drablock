# A5 · Personalidad + crianza
### Entregable de la iteración A5 (v1.0 · **Aprobado**) · *parte de* `Plan-de-Iteraciones.md`

> **Qué es esto:** el puente entre los **genes** (A2) y el **comportamiento final** del dragón. Define los **ejes de temperamento**, cómo la **genética fija el rango** y la **crianza fija el punto**, las **ventanas de desarrollo**, y cómo **emergen las etiquetas** (protector, tímido, fiera...).
>
> **Depende de:** A2, A3 (aprobados). **Hereda:** temperamento heredable como *rango* (A2), acoplamiento `combate ↑ ⇒ temperamento ↑ ⇒ control más difícil` (A2/D2), temperamento alimenta `resistencia()` de la obediencia (A3), trade-offs ventaja/desventaja (A4).

---

## El principio: naturaleza fija el rango, crianza fija el punto

```
GENOTIPO (A2)            CRIANZA (A5)                 COMPORTAMIENTO
rango heredado    →      punto dentro del rango   →   temperamento expresado
[piso, techo]           (lo movés vos)               + etiquetas emergentes
   por eje              dentro de ventanas
```

- La **genética** da, por cada eje, un **sub-rango posible** (nunca todo el espectro). Un dragón puede nacer con `agresividad ∈ [medio, alto]`: jamás será un pacifista total, pero *cuánto* dentro de ese rango lo definís vos.
- La **crianza** mueve el **punto** dentro del rango — pero solo mientras la **ventana de desarrollo** está abierta.
- Ejes distintos tienen rangos genéticos de distinto **ancho**: algunos son muy moldeables (crianza pesa más), otros casi fijos (naturaleza manda).

---

## Ejes de temperamento

**Ocho ejes bipolares.** La posición en cada uno es el temperamento expresado (fenotipo, A2). La variedad de combinaciones es lo que multiplica los perfiles posibles.

| Eje | Polo A ←→ Polo B | Qué gobierna en juego |
|---|---|---|
| **Agresividad** | Dócil ←→ Agresivo | Impulso de combate; cuánto empuja a pelear por su cuenta. |
| **Coraje** | Cauto/Miedoso ←→ Audaz | Tolerancia al riesgo; si acepta órdenes peligrosas sin trabarse. |
| **Autonomía** | Dependiente ←→ Independiente | Cuánto decide solo; frecuencia de *desvío* (A3). |
| **Sociabilidad** | Huraño/Territorial ←→ Sociable | Trato con vos, con otros dragones, con extraños. |
| **Intensidad** | Calmo ←→ Intenso | Energía y reactividad; qué tan explosivas son sus respuestas. |
| **Inteligencia** | Instintivo ←→ Astuto | Velocidad de aprendizaje, comprensión de intenciones complejas, y **calidad** de sus decisiones autónomas. |
| **Tenacidad** | Blando ←→ Terco/Tenaz | Persistencia bajo presión; resistencia a rendirse **y a ser remoldeado** (endurece ventanas y trauma). |
| **Curiosidad** | Reservado ←→ Curioso | Exploración; propensión a meterse en eventos que **generan biografía** (para bien y para mal). |

**Cómo alimentan la obediencia (A3):**
- `resistencia()` sube con **Agresividad + Autonomía + Intensidad + Tenacidad**. Un dragón agresivo, independiente, intenso y terco **cuesta mucho más de controlar** — necesita más vínculo para el mismo nivel de obediencia. Esto **es** el acoplamiento de A2/D2: preparar para el combate empuja esos ejes hacia arriba.
- **Inteligencia** no suma resistencia, pero **cambia la naturaleza del desvío**: un dragón astuto que desvía suele hacer algo *útil* (lee la pelea, improvisa bien); uno instintivo que desvía hace *caos*. También aprende órdenes más rápido y entiende intenciones complejas.
- **Curiosidad** y **Tenacidad** modulan cuánta biografía genera y cuánto le cuesta al jugador (y al adiestrador) reencauzarlo.

---

## Crianza: cómo se mueve el punto (y su costo)

La crianza son las **acciones sostenidas** que empujan cada eje:

| Acción de crianza | Empuja hacia | Costo / trade-off (A4) |
|---|---|---|
| Entrenamiento de combate intenso | Agresividad ↑, Intensidad ↑ | Sociabilidad ↓, control más difícil |
| Disciplina firme y consistente | Respeto (A3), canaliza Agresividad | Requiere constancia; incoherencia lo rompe |
| Exposición gradual a peligro controlado | Coraje ↑ | Mal dosificado → trauma/miedo (A4) |
| Juego, tiempo, cuidado cercano | Apego (A3), Sociabilidad ↑ | Autonomía ↓ (más dependiente) |
| Dejarlo resolver solo, cazar, explorar | Autonomía ↑ | Más desvíos en arena |

> **Trade-off central (estilo Project Zomboid, A4):** no podés maximizar todo. Criar una **fiera de combate** sube Agresividad/Intensidad y **baja Sociabilidad y control**. Criar un **compañero dócil y leal** es más manejable pero **menos explosivo en la arena**. Elegís un perfil, no una barra que solo sube.

---

## Ventanas de desarrollo

Cada eje se moldea en una **ventana** atada a las etapas de edad de A2. Con la ventana abierta, la crianza mueve el punto con facilidad; cerrada, mover el punto es **mucho más caro** (y a veces solo vía biografía/trauma).

| Etapa (A2) | Ventana abierta | Qué se fija sobre todo |
|---|---|---|
| **Cría** (0–2 sem) | Impronta / apego base | Sociabilidad base, apego fundacional (A3). |
| **Juvenil** (2 sem–2 m) | Socialización + miedo | Coraje ↔ Miedo, Sociabilidad. Etapa crítica: el descuido acá deja huella. |
| **Adulto joven** (2–4 m) | Canalización | Agresividad e Intensidad se canalizan (o se desbordan). |
| **Adulto pleno** (4–8 m) | Cristalización | El temperamento se estabiliza; ajustes finos. |
| **Maduro / Anciano** (8 m+) | Casi cerrada | Cambia poco por crianza; sí por biografía (trauma/endurecimiento, A4). |

> **Consecuencia de diseño (ventanas duras — D2):** las ventanas cierran **duro**. Lo que **no** moldeaste a tiempo queda casi fijo: un dragón mal socializado de juvenil **arrastra eso de por vida**, y corregirlo después es lentísimo y caro (o directamente imposible por crianza, solo movible vía biografía/trauma de A4). La **Tenacidad** alta endurece todavía más el cierre. Esto premia con fuerza la atención temprana y sostenida (pilar 4) y le da sentido real a la app companion y al **adiestrador** (ver abajo).

---

## Etiquetas emergentes

Las etiquetas **no se asignan**: **emergen** de la combinación de ejes + biografía. El juego las **nombra** para el jugador (lectura cualitativa, A3/D2), pero son descriptivas, no una clase elegida.

| Etiqueta | Combinación típica | Sabor |
|---|---|---|
| **Protector** | Apego alto + Coraje medio-alto + Agresividad canalizada | Se interpone por vos; defiende sin que se lo pidas (*desvío* bueno). |
| **Tímido** | Miedo alto + Sociabilidad baja + Intensidad baja | Se repliega, evita el conflicto, tarda en confiar. |
| **Lobo solitario** | Autonomía alta + Sociabilidad baja + Coraje alto | Efectivo pero hace la suya; obedece poco lo que no comparte. |
| **Fiera** | Agresividad alta + Intensidad alta + Autonomía alta | La "bomba de tiempo" de A3: devastador y difícil de sostener. |
| **Compañero leal** | Apego alto + Sociabilidad alta + Agresividad media | Manejable, cálido, da el extra; menos explosivo. |
| **Cazador** | Coraje alto + Intensidad alta + Autonomía media | Iniciativa, busca la presa/pelea, disciplinable. |

> Una etiqueta puede **cambiar** si la biografía empuja un eje fuera de su punto (un trauma de A4 puede volver *Tímido* a un ex-*Cazador*). Es identidad viva, no una casilla.

---

## Conexiones aguas abajo

- **A3 (retro):** confirma qué ejes alimentan `resistencia()` y el sabor de cada *desvío por autonomía*.
- **A6 (Ciclo de vida):** las ventanas se cierran con la edad; el temperamento del anciano es casi inamovible por crianza.
- **A7 (Batalla):** el temperamento dicta **autonomía y estilo de pelea** — un *Cazador* abre distinto que una *Fiera*; la Autonomía marca cuántas decisiones toma el dragón solo en la arena.
- **A4 (retro):** los trade-offs de crianza son marcas de biografía en pares ventaja/desventaja.

---

## Veterinario + adiestrador — prevenir vs. descubrir tarde *(resuelve D3)*

El jugador aprende sobre las ventanas de **las dos formas, y ahí está la tensión** (como con una mascota real):

- **Descubrir por consecuencias (gratis):** ves el problema cuando ya se manifiesta en la conducta... y con ventanas duras, **a veces ya es tarde**.
- **Prevenir/acelerar pagando (proactivo):** dos servicios de economía complementarios —
  - **Veterinario** (de A4): salud, diagnóstico, medicamentos.
  - **Adiestrador** *(nuevo):* avisa qué **ventana está abierta** ahora ("está en edad de socializar"), qué conviene hacer, y **acelera, previene o evita** derivas de temperamento antes de que se fijen.
- Igual que la curva del veterinario (A4), la dependencia del adiestrador **decae con tu experiencia de crianza**: con el tiempo ya sabés leer las ventanas vos.

---

## Genética vs. crianza + aleatoriedad *(resuelve D4)*

**Equilibrio entre ambas:** ni la crianza lo determina todo ni la genética condena. **La aleatoriedad del nacimiento** define además **qué tan fácil o difícil** es llegar al perfil que buscás:

- Un dragón puede nacer con rangos **favorables** a tu objetivo (llegar al equilibrio es sencillo) o **contrarios** (posible, pero mucho más trabajo de crianza).
- Esto alimenta la unicidad (pilar 2): dos dragones con el mismo objetivo de crianza **no cuestan lo mismo de criar**.

---

## Decisiones resueltas

- **D1 · Más variedad + Inteligencia:** el set pasó de 5 a **8 ejes** (se sumaron Inteligencia, Tenacidad, Curiosidad).
- **D2 · Ventanas duras:** cierran fuerte; lo no moldeado a tiempo queda casi fijo (solo movible vía biografía/trauma). Tenacidad endurece el cierre.
- **D3 · Ambas vías + adiestrador:** se descubre por consecuencias (gratis, a veces tarde) o se previene/acelera con **veterinario + adiestrador** pagos; la dependencia decae con la experiencia.
- **D4 · Equilibrio + RNG:** balance genética/crianza; la aleatoriedad de nacimiento define cuán fácil es alcanzar el perfil buscado.

---

## Impactos aguas abajo (nuevos, por A5)

- **Economía (Track E):** nuevo servicio de **adiestrador** (proactivo, dependencia decreciente), hermano del veterinario. Sumar a E1.
- **A7 (Batalla):** **Inteligencia** ahora define la **calidad** del desvío autónomo — un input directo del estilo de pelea.
- **A2 (retro):** confirma que los rangos genéticos de temperamento son de **ancho equilibrado** con RNG de nacimiento.

---

## Definición de Hecho (checklist de la compuerta)

- [x] Ejes de temperamento definidos (8 bipolares) con qué gobierna cada uno.
- [x] Cómo la **genética fija el rango** y la **crianza fija el punto** (+ costos/trade-offs + RNG).
- [x] **Ventanas de desarrollo** atadas a las etapas de edad de A2 (cierran duro).
- [x] Cómo **emergen las etiquetas** (combinación de ejes + biografía), con ejemplos.
- [x] Integrado el acoplamiento combate↔temperamento↔control (A2/D2) en `resistencia()` de A3.
- [x] Resueltas D1–D4 (8 ejes · ventanas duras · veterinario+adiestrador · equilibrio+RNG).
- [x] **Confirmado por vos** (aprobado 2026-07-02).
