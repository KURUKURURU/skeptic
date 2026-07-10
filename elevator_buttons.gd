extends StaticBody2D

@onready var interactable: Area2D = $interactable

@export var elevator : StaticBody2D

var can_enter : bool = true

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	t.tune_option(1, "Floor 1")
	t.tune_option(2, "Floor 2")
	t.tune_option(3, "Floor 3")
	
	#t.options(2)
	await t.talk("", "Which floor?", 3)
	
	### here
	
	var answer = t.array.answer
	
	if answer == Global.current_floor:
		await t.talk("", "You're already there stupid.", 0)
		return
	
	match answer:
		1: 
			if !Global.floor_1_open:
				await cancel()
				return
		2: 
			if !Global.floor_2_open:
				await cancel()
				return
		3: 
			if !Global.floor_3_open:
				await cancel()
				return
	
	var step = 1 if answer > Global.current_floor else -1

	for i in range(Global.current_floor, answer + step, step):
		await elevator.set_level(i)
		
		Global.elevator_used = true
		await elevator.open()
		await wait(0.5)
		get_tree().change_scene_to_file("res://scene/scene/floor_" + str(answer) + ".tscn")
		
		return

func cancel():
	await t.talk("", "Can't go there.", 0)
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
