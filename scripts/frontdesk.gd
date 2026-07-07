extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("Nyra", "Time for the night shift.")
	await t.talk("Nyra", "...")
	await t.talk("Business Woman", "Yeah.")
	await t.talk("Business Woman", "...")
	
