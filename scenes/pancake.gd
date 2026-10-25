extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("plate"):
		get_tree().current_scene.add_score(1)
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var screen_height := get_viewport_rect().size.y
	if global_position.y > screen_height + 50:
		get_tree().current_scene.pancake_missed()
		queue_free()
