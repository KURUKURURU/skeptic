extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t._options(3)
	await t.talk("Nyra", "Time for the night shift.")
	
	
