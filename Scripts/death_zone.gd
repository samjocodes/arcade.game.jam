extends Area2D

signal deathzone

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("deathzone")
