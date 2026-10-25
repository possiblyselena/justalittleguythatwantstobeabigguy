extends Node2D

@onready var score = $score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = "You ate " + str(Global.final_score) + " pancakes!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")

func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/startscreen.tscn")
