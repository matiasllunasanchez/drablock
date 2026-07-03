# B1 · Spike de estilo + motor — Nota de conclusión
### Entregable de la iteración B1 (v0.1 · **en revisión — conclusión pendiente de tu run**) · *parte de* `Plan-de-Iteraciones.md` · Track B

> **Qué es esto:** la nota que acompaña al mini-prototipo (`godot-b1-spike/`). Registra el resultado del experimento: **¿la premisa se sostiene?**
>
> **Premisa (reescrita a 2D):** *"la unicidad procedural es barata en 2D modular"*. (Originalmente el plan decía 3D; se cambió a **2D en Godot** por decisión de dirección — MVP indie, encaje con minijuegos de plataformas.)
>
> **Depende de:** A2 (modelo del dragón). El prototipo mapea Genotipo → Fenotipo de A2.

---

## El experimento

- **Motor:** Godot 4.2+ (2D).
- **Prototipo:** `godot-b1-spike/` — 12 dragones en grilla, cada uno desde una semilla → genoma → fenotipo **dibujado por código, sin ningún asset**. Tecla **R** regenera.
- **Qué demuestra:** variación paramétrica modular (tamaño, elemento/color, alas, cuello, cola, cuernos, púas, cicatrices) a costo casi nulo.

## Criterios de "pass" (Definición de Hecho)

- [ ] Se ven **varias variaciones perceptibles** de un vistazo (al menos 12 dragones claramente distintos).
- [ ] Regenerando (R) siguen apareciendo dragones variados y creíbles, sin repetirse obvio.
- [ ] El costo de sumar variación fue **barato** (sin modelar/dibujar cada dragón a mano).
- [ ] **Conclusión escrita** abajo.

---

## Conclusión *(a completar por vos tras correr el prototipo)*

> Corré `godot-b1-spike/` (ver su `README.md`), miralo, y completá:

**¿La premisa se sostiene? (sí / no / con reservas):** _..._

**Observaciones:** _(¿se sienten únicos? ¿el estilo 2D te convence? ¿qué faltó — animación, más partes, expresividad?)_

**Ajustes de estilo/motor antes de seguir:** _(p.ej. pasar a sprites reales + shader, agregar animación esquelética 2D, más partes modulares, paleta por bioma, etc.)_

**Decisión:** _(avanzar a C1 con 2D confirmado · iterar el spike · reconsiderar dimensión)_

---

## Si la premisa NO se sostuviera

El plan dice: si no se sostiene, se **replantea estilo/motor antes de seguir**. Opciones a evaluar entonces: sprites 2D dibujados a mano (menos procedural, más control artístico), otro estilo visual, u — en última instancia — reconsiderar 3D. **No se avanza a C1 hasta cerrar esto.**

---

## Estado de la compuerta

- [x] Prototipo entregado (`godot-b1-spike/`).
- [ ] Prototipo **corrido y visto** por vos.
- [ ] Conclusión escrita (arriba).
- [ ] **Confirmado por vos.** ← el gate (requiere tu run, no lo puedo cerrar yo).
