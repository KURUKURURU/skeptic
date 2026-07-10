extends Node2D
@onready var nyra: CharacterBody2D = $Entities/Nyra

@export var main_elevator: StaticBody2D

func _ready() -> void:
	Global.current_floor = 2
	nyra.teleport_to_spawn()
	main_elevator.set_level(Global.current_floor)
	
	nyra.show()
	
	if Global.elevator_used:
		
		nyra.position.x = -66.298
		nyra.position.y = 812.707
		
		nyra.hide()
		await main_elevator.open()
		await get_tree().create_timer(0.20).timeout
		
		main_elevator.close()
		nyra.show()
		nyra.last_direction = "down"
		
		Global.elevator_used = false
