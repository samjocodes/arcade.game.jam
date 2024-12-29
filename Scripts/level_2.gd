extends Node2D

@export var score = 0
@export var curr_lvl = 2

@onready var past = $past
@onready var future = $future
@onready var player = $Player
@onready var victory = $Victory
@onready var scoreLabel = $UI/Score
@onready var game_over = $GameOver
@onready var enemy = $enemy
@onready var timer = $Timer
@onready var death_zone_2 = $"death zone2"

var time = "future"
var timeout = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("time_shift") && time == "past":
		go_future()
		
	elif Input.is_action_pressed("time_shift") && time == "future":
		go_past()

	scoreLabel.text = "🍎 " + str(score)

func go_past():
	if timeout == true:
		past.position.x = 0
		past.position.y = 0
		future.position.x = 1000
		future.position.y = 1000
		enemy.position.x = 1234
		enemy.position.y = 1040
		death_zone_2.position.x = 1234
		death_zone_2.position.y = 1040
		time = "past"
		print("past")
		timeout = false
		timer.start()

func go_future():
	if timeout == true:
		past.position.x = 1000
		past.position.y = 1000
		future.position.x = 0
		future.position.y = 0
		enemy.position.x = 218
		enemy.position.y = 41
		death_zone_2.position.x = 229
		death_zone_2.position.y = 63
		time = "future"
		print("future")
		timeout = false
		timer.start()

func _score():
	score += 1
	$eat.play()
	print(score)
	if score == 5:
		print("Victory")
		victory.show()
		player.pause()
		enemy.pause()

func _on_death_zone_deathzone():
	game_over.show()
	player.pause()
	enemy.pause()


func _on_timer_timeout() -> void:
	timeout = true
	timer.stop()
	print("timeout")
