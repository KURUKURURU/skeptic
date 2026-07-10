extends Node2D


func _ready() -> void:
	Ui.hide()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/scene/floor_1.tscn")
