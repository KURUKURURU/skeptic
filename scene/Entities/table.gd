extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.window("Nyra", "default")
	await t.talk(true, "This is a table.")
	await t.talk(true, "Looks like someone spilled something on it.")
	
