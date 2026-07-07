extends State
class_name NPC_Move

# im so dang done with this: https://www.youtube.com/watch?v=ow_Lum-Agbs

@export var NPC : CharacterBody2D
@export var move_speed := 100.0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	# Storing the 4 possible directions
	var directions = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]

	# Pick one at random
	move_direction = directions.pick_random()

	wander_time = randf_range(2, 5)
	
func Enter():
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()
		
func Physics_Update(_delta: float):
	if NPC:
		NPC.velocity = move_direction * move_speed
		
	if wander_time < 0:
		Transitioned.emit(self, "Idle")

func get_direction():
	return move_direction

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
