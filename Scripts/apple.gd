extends Area2D

func _ready():
	pass

func _on_body_entered(body):
	queue_free()
	level1._score()
