extends StaticBody2D
@export var message: int = 1
@onready var interactable: Area2D = $interactable

func _ready() -> void:
	match message:
		1:
			$Sprite2D.frame = 0
		2:
			$Sprite2D.frame = 1
	
	interactable.interact = _on_interact
	
func _on_interact():
	
	match message:
		1:
			await t.talk("", "Empty. Like a certain someone's soul.", 0)
			return
		2:
			await t.talk("", "It's filled with broken ballpoint pens and styrofoam cups.", 0)
			await t.talk("", "And some gum.", 0)
			return
