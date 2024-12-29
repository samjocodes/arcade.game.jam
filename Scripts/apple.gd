extends Area2D

var level

func _ready():
	level = get_node("/root/level")

func _on_body_entered(body):
	queue_free()
	level._score()
