extends Path2D

@onready var smart_npc: CharacterBody2D = $PathFollow2D/SmartNPC
@onready var path_follow: PathFollow2D = $PathFollow2D

@export var elevator: StaticBody2D

var walk_up_elevator = load("res://paths/walkup_elevator.tres")
var enter_elevator = load("res://paths/enter_elevator.tres")
var reached_end := false

signal finished

func _ready() -> void:
	print("PATH CREATED:", get_instance_id())
	run_loop()

func run_loop() -> void:
	while true:
		path_follow.progress = 0.0
		await enter()
		await wait(randf_range(10.0,30.0))
		

func _process(_delta: float) -> void:
	
	if path_follow.progress_ratio >= 0.999 and !reached_end:
		reached_end = true
		print("EMITTING FINISHED")
		finished.emit()
		
	#await enter()

func enter():
	reached_end = false
	
	smart_npc.show()
	smart_npc._continue()

	curve = walk_up_elevator

	path_follow.progress = 0
	path_follow.h_offset = 0
	path_follow.v_offset = 0
	path_follow.force_update_transform() #used ai on this part lol

	print("Waiting for finish 1")
	await finished

	print("Finished 1")

	smart_npc._pause()
	#smart_npc.moving = true
	
	print("Going to floor 2")
	await elevator.set_level(2)

	print("Going to floor 1")
	await elevator.set_level(1)

	await elevator.open()
	
	curve = enter_elevator
	path_follow.progress = 0
	path_follow.progress_ratio = 0
	reached_end = false

	smart_npc._continue()

	print("Waiting for finish 2")
	await finished

	print("Finished 2")

	smart_npc.hide()
	smart_npc._pause()
	await elevator.close()

	await elevator.set_level(1)
	await elevator.set_level(2)

	print("End")
	path_follow.progress_ratio = 0.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
