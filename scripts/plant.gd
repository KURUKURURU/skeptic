extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("", "It's hard to be a plant.", 0)
	await t.talk("", "You should know; you are one.", 0)
	
