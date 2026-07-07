extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction : String
var moving := true

func _physics_process(delta: float) -> void:
	
	if moving:
		if velocity.x > 0 : 
			sprite.play("right")
			last_direction = "right"
			
		elif velocity.x < 0 : 
			sprite.play("left")
			last_direction = "left"
			
		elif velocity.y > 0 : 
			sprite.play("down")
			last_direction = "down"
			
		elif velocity.y < 0 : 
			sprite.play("up")
			last_direction = "up"
		
		else:
			if !last_direction: last_direction = "down"
			sprite.play(last_direction + "_2")
	
	else:
		sprite.play("down_2")
	
	
	move_and_slide() 
