extends Control

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func _on_play_button_pressed():
	var game_scene = load("res://Scenes/level_1.tscn")
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
