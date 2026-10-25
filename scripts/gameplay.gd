extends Node2D

@onready var counter : Label = $counter
var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.play()
	update_counter()

func add_score(amount: int) -> void:
	score += amount
	update_counter()
	
func update_counter() -> void:
	counter.text = "number of pancakes eaten:" + str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
