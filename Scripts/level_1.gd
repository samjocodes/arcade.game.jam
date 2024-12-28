extends Node2D

@onready var past = $past
@onready var future = $future

var time = "future"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
		if Input.is_action_pressed("time_shift") && time == "past":
			go_future()
		
		elif Input.is_action_pressed("time_shift") && time == "future":
			go_past()

func go_past():
	past.position.x = 0
	past.position.y = 0
	future.position.x = 1000
	future.position.y = 1000
	time = "past"
	print("past")

func go_future():
	past.position.x = 1000
	past.position.y = 1000
	future.position.x = 0
	future.position.y = 0
	time = "future"
	print("future")
