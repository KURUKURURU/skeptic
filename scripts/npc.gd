
# used ai here lol i gave up on debugging

extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction : String
var moving := true

func _physics_process(delta: float) -> void:
	var original_velocity = velocity
	var position_before_move = global_position
	
	move_and_slide() 
	var distance_moved = global_position.distance_to(position_before_move)
	
	if moving:
		if original_velocity != Vector2.ZERO and distance_moved < 0.1:
			if !last_direction: last_direction = "down"
			sprite.play(last_direction + "_2")
			
		elif original_velocity.x > 0: 
			sprite.play("right")
			last_direction = "right"
			
		elif original_velocity.x < 0: 
			sprite.play("left")
			last_direction = "left"
			
		elif original_velocity.y > 0: 
			sprite.play("down")
			last_direction = "down"
			
		elif original_velocity.y < 0: 
			sprite.play("up")
			last_direction = "up"
			
		else:
			if !last_direction: last_direction = "down"
			sprite.play(last_direction + "_2")
	
	else:
		if !last_direction: last_direction = "down"
		sprite.play(last_direction + "_2")
