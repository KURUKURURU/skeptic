extends StaticBody2D

@onready var interactable: Area2D = $interactable

@export var elevator : StaticBody2D

var can_enter : bool = true

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.tune_option(1, "Floor 2")
	t.tune_option(2, "Floor 3")
	
	t.options(2)
	await t.talk("", "Which floor?")
	
	### here
	
	var answer = t.answer
	
	match answer:
		1: 
			if can_enter:
				await enter_elevator()
			else:
				await t.talk("", "You sadly have no reason to go up there.")
			
		2: await t.talk("", "Off limits.")
	
	return

func enter_elevator():
	elevator.animation.play("open")
	await elevator.animation.animation_finished
	print("entered")
