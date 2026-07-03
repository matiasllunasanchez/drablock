# Drablock — B1 spike (2D) · Cómo correrlo

Mini-prototipo de Godot 4 para validar la premisa de B1: **la unicidad procedural es barata en 2D modular**.

## Qué hace
Dibuja **12 dragones únicos**, cada uno generado desde una **semilla** → un **genoma** (el modelo de A2) → un **fenotipo dibujado por código**. **No usa ningún asset** (ni un solo PNG): todo son polígonos y colores calculados. Cada dragón varía en tamaño, color/elemento, forma de alas, cuello, cola, cuernos, púas y **cicatrices** (guiño a la Biografía / A4).

## Requisitos
- **Godot 4.2 o superior** (2D). Descarga: https://godotengine.org/download
- No hace falta nada más (sin dependencias, sin assets externos).

## Correrlo
1. Abrí Godot 4.
2. *Import* → elegí el archivo `project.godot` de esta carpeta.
3. Apretá **Play** (F5).
4. En la ventana: **R** = regenerar 12 dragones nuevos con semillas frescas.

O por terminal (si tenés el binario de Godot en PATH):
```bash
godot4 --path .
```

## Qué mirar (para la conclusión de B1)
- ¿Se ven **perceptiblemente distintos** entre sí de un vistazo?
- Apretando **R** varias veces, ¿siguen apareciendo dragones variados y creíbles?
- ¿El costo de sumar variación fue barato? (todo esto es ~1 archivo de dibujo, sin arte)

Anotá tu veredicto en `../B1-Spike-nota.md`.

## Archivos
- `project.godot` — config mínima del proyecto.
- `Main.tscn` / `Main.gd` — arma la grilla y regenera con R.
- `DragonSpecimen.gd` — el genoma (A2) y el dibujo del dragón (fenotipo).

## Nota honesta
Este spike prueba la **variación paramétrica modular** por código. En producción, el camino equivalente y también barato es **sprites modulares + shader de tinte/patrón + capas de cicatrices** — el principio (unicidad barata sin modelar 1 a 1 cada dragón) es el mismo, y este proto lo demuestra en su forma más extrema (cero assets).
