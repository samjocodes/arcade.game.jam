extends TileMapLayer

@export var score = 0
var Life = 3
var is_dead = false

@onready var lifeLabel = $UI/Life
@onready var countdown_timer = $Timer/CountdownTimer
@onready var scoreLabel = $UI/Score
@onready var game_over = $GameOver
@onready var victory = $Victory
@onready var player: CharacterBody2D = %Player
@onready var player_mark: Marker2D = $Markers/PlayerMark
@onready var enemy: CharacterBody2D = $Enemies/enemy
@onready var enemy_2: CharacterBody2D = $Enemies/enemy2
@onready var enemy_mark: Marker2D = $Markers/EnemyMark
@onready var enemy_mark_2: Marker2D = $Markers/EnemyMark2
@onready var timer: Timer = $Timer  # Assuming you have a Timer node in the scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	death_pause()
	print(score)
	
func _process(delta):
	if is_dead:
		
		countdown_timer.hide()
		player.pause()
		enemy.pause()
		enemy_2.pause()
		game_over.show()
		
	scoreLabel.text = "Score: " + str(score)
	lifeLabel.text = "Lives: " + str(Life)
	countdown_timer.text = str(int(timer.time_left) + 1)
	
func _score():
	score += 1
	print(score)
	$Coin.play()
	if score == 121:
		print("Victory")
		$Win.play()
		countdown_timer.hide()
		victory.show()
		player.pause()
		enemy.pause()
		enemy_2.pause()

func player_died():
	Life = Life - 1
	Life = max(Life, 0)
	print("Life Left: ", Life)
	if Life == 0:
		$Dead.play()
		print("You Died")
		is_dead = true
	else:
		$Hurt.play()

# Function to handle player death
func _on_enemy_kill() -> void:
	death_pause()
	player_died()

# Function to handle second enemy kill
func _on_enemy_2_kill() -> void:
	death_pause()
	player_died()

# Function to unpause the game after 3 seconds
func _on_timer_timeout() -> void:
	player.play()
	enemy.play()
	enemy_2.play()
	countdown_timer.hide()
	print("Game unpaused")
	
func death_pause():
	# Same logic as _on_enemy_kill for second enemy
	player.position = player_mark.position
	enemy.position = enemy_mark.position
	enemy_2.position = enemy_mark_2.position
	
	player.pause()
	enemy.pause()
	enemy_2.pause()
	
	timer.start()
	countdown_timer.show()
