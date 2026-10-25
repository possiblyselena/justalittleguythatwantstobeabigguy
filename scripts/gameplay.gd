extends Node2D

@onready var counter : Label = $counter
var score: int = 0
var lives: int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.play()
	update_counter()
	$"3lives".show()
	$"2lives".hide()
	$"1life".hide()
	
	hide

func add_score(amount: int) -> void:
	score += amount
	update_counter()
	
func update_counter() -> void:
	counter.text = "number of pancakes eaten:" + str(score)

func pancake_missed() -> void:
	lives -= 1
	if lives == 2:
		$"3lives".hide()
		$"2lives".show()
	else: if lives == 1:
		$"2lives".hide()
		$"1life".show()
		
	if lives <= 0:
		Global.final_score = score
		get_tree().change_scene_to_file("res://scenes/endscreen.tscn")
