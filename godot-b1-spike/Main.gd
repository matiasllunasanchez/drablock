extends Node2D
# Drablock · B1 spike (2D)
# Genera una grilla de dragones únicos, cada uno a partir de una semilla.
# Prueba la premisa: "la unicidad procedural es barata en 2D modular".
# Cada dragón = un genoma (modelo de A2) dibujado por código, sin ningún asset.

const COLS := 4
const ROWS := 3
const CELL := Vector2(300, 210)
const MARGIN := Vector2(70, 95)

var specimens: Array = []
var labels: Array = []

func _ready() -> void:
	# Fondo oscuro
	var bg := ColorRect.new()
	bg.color = Color(0.09, 0.10, 0.13)
	bg.size = Vector2(1280, 720)
	bg.z_index = -10
	add_child(bg)

	_build_header()
	_spawn_grid()
	_regenerate(randi())

func _build_header() -> void:
	var title := Label.new()
	title.text = "Drablock · B1 spike — Unicidad procedural en 2D (12 dragones, 0 assets)"
	title.position = Vector2(24, 18)
	title.add_theme_font_size_override("font_size", 20)
	add_child(title)

	var hint := Label.new()
	hint.text = "R = regenerar semillas    ·    cada dragón = un genoma (A2) dibujado por código"
	hint.position = Vector2(24, 48)
	hint.modulate = Color(0.7, 0.75, 0.85)
	add_child(hint)

func _spawn_grid() -> void:
	for i in range(COLS * ROWS):
		var col := i % COLS
		var row := i / COLS
		var cell_pos := MARGIN + Vector2(col * CELL.x, row * CELL.y)
		var center := cell_pos + Vector2(CELL.x * 0.5, CELL.y * 0.42)

		var spec := DragonSpecimen.new()
		spec.position = center
		add_child(spec)
		specimens.append(spec)

		var lbl := Label.new()
		lbl.position = cell_pos + Vector2(8, CELL.y - 42)
		lbl.custom_minimum_size = Vector2(CELL.x - 16, 36)
		lbl.add_theme_font_size_override("font_size", 12)
		lbl.modulate = Color(0.82, 0.87, 0.97)
		add_child(lbl)
		labels.append(lbl)

func _regenerate(seed_val: int) -> void:
	for i in range(specimens.size()):
		var g: Dictionary = specimens[i].randomize_from(seed_val + i * 7919)
		labels[i].text = _summary(g)

func _summary(g: Dictionary) -> String:
	return "%s · escala %d%% · alas %s\ncuernos %d · cicatrices %d" % [
		g.element_name, int(round(g.size_class * 100.0)), g.wing_name, g.horn_count, g.scar_count
	]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_R:
		_regenerate(randi())
