extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.window("Nyra", "default")
	await t.talk(true, "Time for the night shift.")
	await t.talk(true, "...")
	
	t.other_window("Business Woman", "default")
	await t.talk(false, "Time for the night shift.")
	
	t.window("Nyra", "default")
	await t.talk(true, "...")
	
