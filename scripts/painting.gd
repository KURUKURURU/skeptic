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
			await t.talk("", "They're the leading biomedical giant.")
			await t.talk("", "They make commerical products that chemically enhance cognitive and physical abilities.")
			await t.talk("", "Though, this company isn't what everyone thinks it is.")
			return
			
		1:
			await t.talk("", "I think it's a brain.")
			await t.talk("", "I hate it.")
			return
		2:
			await t.talk("", "It's a DNA Helix.")
			await t.talk("", "Fitting.")
			return
		3:
			await t.talk("", "You're on Floor 1.")
			await t.talk("", "This floor contains conference rooms or large presentation spaces.")
			await t.talk("", "So most visitors stay down here.")
			return
	
