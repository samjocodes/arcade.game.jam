extends Node2D

@onready var past = $past
@onready var future = $future
@export var score = 0
@onready var player = $Player
@onready var victory = $Victory
@onready var scoreLabel = $UI/Score
@onready var game_over = $GameOver

var time = "future"

func _process(delta: float) -> void:
	if Input.is_action_pressed("time_shift") && time == "past":
		go_future()
		
	elif Input.is_action_pressed("time_shift") && time == "future":
		go_past()

	scoreLabel.text = "🍎 " + str(score)

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

func _score():
	score += 1
	print(score)
	if score == 5:
		print("Victory")
		victory.show()
		player.pause()

func _on_death_zone_deathzone() -> void:
	game_over.show()
	player.pause()
