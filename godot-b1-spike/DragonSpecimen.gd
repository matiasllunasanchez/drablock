class_name DragonSpecimen
extends Node2D
# Un dragón dibujado 100% por código a partir de un genoma.
# Mapea directo el modelo de A2: Genotipo (semilla → rangos) → Fenotipo (lo dibujado).
# Las cicatrices son un guiño a la Biografía (A4).

var genome: Dictionary = {}

const ELEMENTS := [
	{"name": "Fuego",  "hue": 0.02},
	{"name": "Hielo",  "hue": 0.55},
	{"name": "Tierra", "hue": 0.10},
	{"name": "Viento", "hue": 0.35},
	{"name": "Sombra", "hue": 0.76},
	{"name": "Rayo",   "hue": 0.15},
]
const WING_SHAPES := ["membranosas", "emplumadas", "cortas"]

# --- Genotipo: la semilla fija todo el potencial de este dragón ---
func randomize_from(seed_val: int) -> Dictionary:
	var rng := RandomNumberGenerator.new()
	rng.seed = seed_val

	var elem: Dictionary = ELEMENTS[rng.randi_range(0, ELEMENTS.size() - 1)]
	var base_hue: float = fposmod(elem.hue + rng.randf_range(-0.04, 0.04), 1.0)
	var sat: float = rng.randf_range(0.45, 0.80)
	var val: float = rng.randf_range(0.60, 0.95)

	genome = {
		"element_name": elem.name,
		"base_color":   Color.from_hsv(base_hue, sat, val),
		"belly_color":  Color.from_hsv(fposmod(base_hue + 0.05, 1.0), sat * 0.5, min(val * 1.15, 1.0)),
		"accent_color": Color.from_hsv(fposmod(base_hue + 0.5, 1.0), sat * 0.8, val),
		"eye_color":    Color.from_hsv(fposmod(base_hue + 0.5, 1.0), 0.7, 1.0),
		"size_class":   rng.randf_range(0.80, 1.25),
		"body_len":     rng.randf_range(64, 88),
		"body_h":       rng.randf_range(30, 44),
		"neck_len":     rng.randf_range(26, 46),
		"head":         rng.randf_range(16, 24),
		"tail_len":     rng.randf_range(55, 92),
		"wing_span":    rng.randf_range(46, 82),
		"wing_name":    WING_SHAPES[rng.randi_range(0, WING_SHAPES.size() - 1)],
		"horn_count":   rng.randi_range(0, 3),
		"horn_len":     rng.randf_range(8, 18),
		"spike_count":  rng.randi_range(4, 10),
		"scar_count":   rng.randi_range(0, 4),
		"scar_seed":    rng.randi(),
	}
	queue_redraw()
	return genome

# --- Fenotipo: se dibuja lo que el genoma expresa ---
func _draw() -> void:
	if genome.is_empty():
		return

	var s: float = genome.size_class
	draw_set_transform(Vector2.ZERO, 0.0, Vector2(s, s))

	var bl: float = genome.body_len * 0.5   # semieje x del cuerpo
	var bh: float = genome.body_h * 0.5     # semieje y del cuerpo

	# 1) Ala (detrás de todo)
	var wr: float = genome.wing_span
	var wing := PackedVector2Array([
		Vector2(-bl * 0.5, -bh * 0.6),
		Vector2(bl * 0.1, -bh * 0.6),
		Vector2(bl * 0.2 + wr * 0.2, -bh - wr * 0.7),
		Vector2(-bl * 0.3, -bh - wr),
	])
	draw_colored_polygon(wing, genome.accent_color.darkened(0.15))
	for i in range(3):
		var t := float(i + 1) / 4.0
		draw_line(Vector2(-bl * 0.1, -bh * 0.6), wing[2].lerp(wing[3], t), genome.base_color.darkened(0.2), 1.5)

	# 2) Cola
	var tip := Vector2(-bl - genome.tail_len, -bh * 0.2)
	draw_colored_polygon(PackedVector2Array([
		Vector2(-bl * 0.85, -bh * 0.5),
		Vector2(-bl * 0.85, bh * 0.5),
		tip,
	]), genome.base_color)
	draw_colored_polygon(PackedVector2Array([
		tip + Vector2(0, -7), tip + Vector2(-11, 0), tip + Vector2(0, 7),
	]), genome.accent_color)

	# 3) Patas
	for lx in [bl * 0.45, -bl * 0.4]:
		draw_line(Vector2(lx, bh * 0.5), Vector2(lx, bh + 12), genome.base_color.darkened(0.15), 6.0)
		draw_circle(Vector2(lx, bh + 12), 3.5, genome.base_color.darkened(0.25))

	# 4) Cuerpo + panza
	var body := _ellipse(Vector2.ZERO, bl, bh, 26)
	draw_colored_polygon(body, genome.base_color)
	_outline(body, genome.base_color.darkened(0.4))
	draw_colored_polygon(_ellipse(Vector2(bl * 0.05, bh * 0.35), bl * 0.7, bh * 0.55, 22), genome.belly_color)

	# 5) Cicatrices (Biografía, A4)
	var srng := RandomNumberGenerator.new()
	srng.seed = genome.scar_seed
	for i in range(genome.scar_count):
		var c := Vector2(srng.randf_range(-bl * 0.4, bl * 0.4), srng.randf_range(-bh * 0.4, bh * 0.4))
		var ang := srng.randf_range(-0.6, 0.6)
		var slen := srng.randf_range(6.0, 12.0)
		var d := Vector2(cos(ang), sin(ang)) * slen
		draw_line(c - d * 0.5, c + d * 0.5, Color(0.90, 0.20, 0.20), 2.0)

	# 6) Púas dorsales
	var top_start := Vector2(bl * 0.4, -bh * 0.95)
	var top_end := Vector2(-bl * 0.95, -bh * 0.2)
	for i in range(genome.spike_count):
		var t := float(i) / float(max(genome.spike_count - 1, 1))
		var p := top_start.lerp(top_end, t)
		draw_colored_polygon(PackedVector2Array([
			p + Vector2(-3, 0), p + Vector2(3, 0), p + Vector2(0, -6.0 - genome.body_h * 0.05),
		]), genome.accent_color)

	# 7) Cuello + cabeza
	var neck_root := Vector2(bl * 0.7, -bh * 0.2)
	var head_c := neck_root + Vector2(genome.neck_len * 0.7, -genome.neck_len * 0.7)
	draw_line(neck_root, head_c, genome.base_color, bh * 0.9)
	var hr: float = genome.head * 0.5
	draw_circle(head_c, hr, genome.base_color)
	# hocico
	draw_colored_polygon(PackedVector2Array([
		head_c + Vector2(hr * 0.6, -hr * 0.3),
		head_c + Vector2(hr * 1.7, 0),
		head_c + Vector2(hr * 0.6, hr * 0.55),
	]), genome.base_color)

	# 8) Cuernos
	for i in range(genome.horn_count):
		var base := Vector2(head_c.x - hr * 0.3 - i * 4.0, head_c.y - hr * 0.7)
		draw_colored_polygon(PackedVector2Array([
			base + Vector2(-3, 0), base + Vector2(3, 0), base + Vector2(-2, -genome.horn_len),
		]), genome.accent_color)

	# 9) Ojo
	draw_circle(head_c + Vector2(hr * 0.45, -hr * 0.2), hr * 0.28, Color.WHITE)
	draw_circle(head_c + Vector2(hr * 0.52, -hr * 0.2), hr * 0.14, genome.eye_color)

func _ellipse(c: Vector2, rx: float, ry: float, seg: int) -> PackedVector2Array:
	var pts := PackedVector2Array()
	for i in range(seg):
		var a := TAU * float(i) / float(seg)
		pts.append(c + Vector2(cos(a) * rx, sin(a) * ry))
	return pts

func _outline(pts: PackedVector2Array, color: Color) -> void:
	var closed := PackedVector2Array(pts)
	closed.append(pts[0])
	draw_polyline(closed, color, 2.0)
