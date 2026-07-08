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
			await t.talk("", "They're the leading biomedical giant.", 0)
			await t.talk("", "They make commerical products that chemically enhance cognitive and physical abilities.", 0)
			await t.talk("", "Though, this company isn't what everyone thinks it is.", 0)
			return
			
		1:
			await t.talk("", "I think it's a brain.", 0)
			await t.talk("", "I hate it.", 0)
			return
		2:
			await t.talk("", "It's a DNA Helix.", 0)
			await t.talk("", "Fitting.", 0)
			return
		3:
			await t.talk("", "You're on Floor 1.", 0)
			await t.talk("", "This floor contains conference rooms or large presentation spaces.", 0)
			await t.talk("", "So most visitors stay down here.", 0)
			return
	
