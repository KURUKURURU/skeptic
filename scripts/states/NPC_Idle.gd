extends State
class_name NPC_Idle

# im so dang done with this: https://www.youtube.com/watch?v=ow_Lum-Agbs

@export var NPC : CharacterBody2D
@export var move_speed := 100.0

var stand_time : float

func randomize_idle():
	# An idle state doesn't move, so direction is lowkirkeuinuely zero
	if NPC:
		NPC.velocity = Vector2.ZERO

	# How long the NPC will stand still before doing something else
	stand_time = randf_range(1.5, 3.5)

func Enter():
	randomize_idle()
	
func Update(delta: float):
	if stand_time > 0:
		stand_time -= delta
		
	else:
		randomize_idle()
		
func Physics_Update(_delta: float):
	if NPC:
		NPC.velocity = Vector2.ZERO
		
	if stand_time < 0:
		Transitioned.emit(self, "Move")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
