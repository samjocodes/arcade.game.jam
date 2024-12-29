extends Node2D

@onready var past = $past
@onready var future = $future
@export var score = 0
@onready var player = $Player
@onready var victory = $Victory
@onready var scoreLabel = $UI/Score

var time = "future"

func _process(delta: float) -> void:
	if Input.is_action_pressed("time_shift") && time == "past":
		go_future()
		
	elif Input.is_action_pressed("time_shift") && time == "future":
		go_past()

	scoreLabel.text = "Score " + str(score)

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
	$Coin.play()
	if score == 5:
		print("Victory")
		$Win.play()
		victory.show()
		player.pause()
