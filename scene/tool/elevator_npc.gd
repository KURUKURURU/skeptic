extends Path2D

@onready var smart_npc: CharacterBody2D = $PathFollow2D/SmartNPC
@onready var path_follow: PathFollow2D = $PathFollow2D

@export var elevator: StaticBody2D

var walk_up_elevator = load("res://paths/walkup_elevator.tres")
var enter_elevator = load("res://paths/enter_elevator.tres")

signal finished

func _ready() -> void:
	run_loop()

func run_loop() -> void:
	while true:
		path_follow.progress = 0.0
		await enter()

func _process(_delta: float) -> void:
	if path_follow.progress_ratio >= 0.999:
		finished.emit()
		
	#await enter()

func enter():
	print(path_follow)
	print(smart_npc.path_follow)
	print(path_follow == smart_npc.path_follow)
	print("Start")

	smart_npc.show()
	curve = walk_up_elevator
	path_follow.progress = 0
	path_follow.progress_ratio = 0

	print("Waiting for finish 1")
	await finished

	print("Finished 1")

	await smart_npc._pause()
	#smart_npc.moving = true
	
	print("Going to floor 2")
	await elevator.set_level(2)

	print("Going to floor 1")
	await elevator.set_level(1)

	await elevator.open()
	
	curve = enter_elevator
	path_follow.progress = 0
	path_follow.progress_ratio = 0
	
	await smart_npc._continue()

	print("Waiting for finish 2")
	await finished

	print("Finished 2")

	smart_npc.hide()
	await smart_npc._pause()
	await elevator.close()

	await elevator.set_level(1)
	await elevator.set_level(2)

	print("End")
	path_follow.progress_ratio = 0.0
