extends CharacterBody2D
@onready var animation = $animation
@onready var steps = $steps
@export var speed = 300 

var last_direction
var is_moving := false

var moving:
	get:
		return t.can_move

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("shift"):
		speed = 300
		steps.pitch_scale = 1.5
	else:
		speed = 200
		steps.pitch_scale = 1.0
	
	if is_moving:
		if !steps.playing:
			steps.play()
	else:
		steps.stop()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	
# setup direction of movement
	
	if moving:
		if Input.is_action_pressed("right"):
			is_moving = true
			animation.play("right")
			direction.y = 0
			last_direction = "right"
		elif Input.is_action_pressed("left"):
			is_moving = true
			animation.play("left")
			direction.y = 0
			last_direction = "left"
		elif Input.is_action_pressed("up"):
			is_moving = true
			animation.play("up")
			direction.x = 0
			last_direction = "up"
		elif Input.is_action_pressed("down"):
			is_moving = true
			animation.play("down")
			direction.x = 0
			last_direction = "down"
		elif Input.is_action_pressed("interact"):
			if last_direction == null:
				last_direction = "down"
			
			animation.play(str(last_direction) + "_3")
			direction.x = 0
			direction.y = 0
		else:
			is_moving = false
			direction = Vector2.ZERO
			
			if last_direction == null:
				last_direction = "down"
				
			animation.play( str(last_direction) + "_2")
	
		
		

		direction = direction.normalized()
# setup the actual movement
		velocity = (direction * speed)
		move_and_slide()
	
	#if Input.is_action_pressed("right") || Input.is_action_pressed("left") or Input.is_action_pressed("up") || Input.is_action_pressed("down") :
		##if animation.animation == "wal":
		#animation.play("walk")
	#else:
		#animation.play("idle")
