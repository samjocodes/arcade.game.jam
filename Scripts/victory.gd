extends CanvasLayer

var level
@onready var lvlbuttton = $VBoxContainer/Lvlbuttton

func _ready():
	level = get_node("/root/level")
	if level.curr_lvl == 3:
		lvlbuttton.text = "Retry"

func _on_lvlbuttton_pressed() -> void:
	if level.curr_lvl == 1:
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	elif level.curr_lvl == 2:
		get_tree().change_scene_to_file("res://Scenes/level_3.tscn")
	elif level.curr_lvl == 3:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_menubutton_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
