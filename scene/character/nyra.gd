extends CharacterBody2D
@onready var animation = $animation

@export var speed = 300 
var moving = true
var last_direction
#
#func _process(delta: float) -> void:
	#if :
		##if animation.animation == "wal":
		#animation.play("walk")

func _physics_process(delta):
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
	 
	
	if moving:
		if Input.is_action_pressed("right"):
			animation.play("right")
			direction.y = 0
			last_direction = "right"
		elif Input.is_action_pressed("left"):
			animation.play("left")
			direction.y = 0
			last_direction = "left"
		elif Input.is_action_pressed("up"):
			animation.play("up")
			direction.x = 0
			last_direction = "up"
		elif Input.is_action_pressed("down"):
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
