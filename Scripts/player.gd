extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0
var dirn = "right"

func _ready() -> void:
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta) -> void:
	# Reset horizontal velocity
	velocity.x = 0

	# Add the gravity if the character is not on the floor
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	player_movement(delta)

func player_movement(delta):

	if Input.is_action_pressed("ui_left"):
		dirn = "left"
		velocity.x = -SPEED
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Walk")
	elif Input.is_action_pressed("ui_right"):
		dirn = "right"
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Walk")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("Idle")

	# Move the character
	move_and_slide()

func pause():
	process_mode = PROCESS_MODE_DISABLED

func play():
	process_mode = PROCESS_MODE_INHERIT
