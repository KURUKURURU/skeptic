extends Path2D

@onready var smart_npc: CharacterBody2D = $PathFollow2D/SmartNPC
@onready var path_follow: PathFollow2D = $PathFollow2D

@export var elevator: StaticBody2D

var walk_up_elevator = load("res://paths/walkup_elevator.tres")
var enter_elevator = load("res://paths/enter_elevator.tres")

signal finished

func _ready() -> void:
	elevator.set_level(2)
	await enter()

func _process(_delta: float) -> void:
	if path_follow.progress_ratio == 1.0:
		finished.emit()

func enter():
	smart_npc.show()
	curve = walk_up_elevator
	await finished
	
	await smart_npc._pause()
	
	await elevator.set_level(2)
	await elevator.set_level(1)
	
	await elevator.open()
	
	curve = enter_elevator
	
	await smart_npc._continue()
	await finished
	
	smart_npc.hide()
	await elevator.close()
	
	await elevator.set_level(1)
	await elevator.set_level(2)
	
	
	
	return
	
