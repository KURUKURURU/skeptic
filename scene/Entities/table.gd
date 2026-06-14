extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await Textbox.talk("", "This is a table.")
	await Textbox.talk("", "Looks like someone spilled something on it.")
	
