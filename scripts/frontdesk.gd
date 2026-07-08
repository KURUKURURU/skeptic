extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.tune_option(1, "YES!! YAY!")
	t.tune_option(2, "No.")
	
	
	await t.talk("", "Time for your night shift?", 2)
	#await t.options(2)
	
	var answer = t.array.answer
	
	match answer:
		1: 
			await t.talk("Nyra", "Yay.", 0)
			# do something
			
		2: await t.talk("Nyra", "Yay.", 0)
	
