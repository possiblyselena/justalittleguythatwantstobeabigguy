extends Node2D

@export var pancakes: Array[PackedScene] = []
@export var spawn_delay := 2.0

var current_pancake: RigidBody2D

func _ready():
	spawn_pancake()

func spawn_pancake():
	current_pancake = pancakes.pick_random().instantiate()
	current_pancake.global_position = global_position
	get_parent().add_child.call_deferred(current_pancake)
	
	await get_tree().create_timer(spawn_delay).timeout
	spawn_pancake()

func _unhandled_input(event):	
	if event.is_action_pressed("ui_accept") and current_pancake:
		current_pancake.freeze = false
		current_pancake = null
		await get_tree().create_timer(0.8).timeout
		spawn_pancake()
