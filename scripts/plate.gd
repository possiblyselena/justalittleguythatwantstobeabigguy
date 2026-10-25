extends AnimatableBody2D

@export var speed := 900.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	position.x += direction * speed * delta
	
	var screen_width := get_viewport_rect().size.x
	position.x = clamp(position.x, 0, screen_width)
