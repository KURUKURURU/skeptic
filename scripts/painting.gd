extends StaticBody2D

@export var tag: String
@export var message: int

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact_name = tag 
	interactable.interact = _on_interact
	
func _on_interact():
	
	match message:
		0:
			await t.talk("Nyra", "They're the leading biomedical giant.")
			await t.talk("Nyra", "They make commerical products that chemically enhance cognitive and physical abilities.")
			await t.talk("Nyra", "Though, this company isn't what everyone thinks it is.")
			return
			
		1:
			await t.talk("Nyra", "I think it's a brain.")
			await t.talk("Nyra", "I hate it.")
			return
		2:
			await t.talk("Nyra", "It's a DNA Helix.")
			await t.talk("Nyra", "Fitting.")
			return
			
	
