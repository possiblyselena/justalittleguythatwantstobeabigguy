extends Node2D

@export var pancakes: Array[PackedScene] = []
@export var spawn_delay := 1.0
@export var edge_margin := 50.0

func _ready() -> void:
	spawn_pancake()

func spawn_pancake() -> void:
	var pancake = pancakes.pick_random().instantiate()
	var screen_width := get_viewport_rect().size.x
	var random_x := randf_range(edge_margin, screen_width - edge_margin)
	pancake.global_position = Vector2(random_x, global_position.y)
	get_parent().add_child.call_deferred(pancake)

	await get_tree().create_timer(spawn_delay).timeout
	spawn_pancake()
