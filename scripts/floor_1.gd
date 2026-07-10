extends Node2D
@onready var nyra: CharacterBody2D = $Entities/Nyra

@export var main_elevator: StaticBody2D
@export var cutscene := true

var bus_bg = AudioServer.get_bus_index("bg")

func _ready() -> void:
	main_elevator.set_level(Global.current_floor)
	nyra.teleport_to_spawn()
	nyra.show()
	
	if Global.elevator_used:
		
		nyra.position.x = -66.298
		nyra.position.y = 812.707
		
		nyra.hide()
		await main_elevator.open()
		await get_tree().create_timer(0.20).timeout
		
		nyra.show()
		main_elevator.close()
		nyra.last_direction = "down"
		
		Global.elevator_used = false
	
	Global.current_floor = 1
	
	if cutscene:
		AudioServer.set_bus_mute(bus_bg, true)
		await Cutscene.scene("Open")
		AudioServer.set_bus_mute(bus_bg, false)
		
	Music._play("lounge")
	Ui.show()
	


func _process(delta: float) -> void:
	pass
