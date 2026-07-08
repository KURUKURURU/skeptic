extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("", "This is a table.", 0)
	await t.talk("", "Looks like someone spilled something on it.", 0)
	
