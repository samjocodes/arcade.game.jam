extends Area2D

signal deathzone

func _on_body_entered(body: Node2D) -> void:
	emit_signal("deathzone")
