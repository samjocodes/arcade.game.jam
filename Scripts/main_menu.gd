extends Control

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func _on_play_button_pressed():
	var game_scene = load("res://Scenes/Game.tscn")
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
