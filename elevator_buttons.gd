extends StaticBody2D

@onready var interactable: Area2D = $interactable

@export var elevator : StaticBody2D

var can_enter : bool = true

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.tune_option(1, "Floor 2")
	t.tune_option(2, "Floor 3")
	
	#t.options(2)
	await t.talk("", "Which floor?", 2)
	
	### here
	
	var answer = t.array.answer
	
	match answer:
		1: 
			if can_enter:
				await elevator.open()
			else:
				await t.talk("", "You sadly have no reason to go up there.", 0)
			
		2: await t.talk("", "Off limits.", 0)
	
	return
