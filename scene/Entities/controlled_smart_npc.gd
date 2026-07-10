extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var path_follow: PathFollow2D 
@export var path: Path2D 

@export var move_speed: float = 100.0
@export var loop_path: bool = false
@export var moving: bool = true

var last_position : Vector2
var last_direction : String
var movement

func _pause():
	moving = false
	return
	
func _continue():
	path_follow.progress_ratio = 0.0
	moving = true
	return
	

func _ready() -> void:
	last_position = global_position
	
func _physics_process(delta: float) -> void:
	
	if moving:
		path_follow.progress += move_speed * delta
	else: _update_animation(movement) 
	
	movement = global_position - last_position
	if movement.length() > 0.1: 
		_update_animation(movement) 
	
	last_position = global_position
		

func _update_animation(movement: Vector2):
	if moving:
		if movement.x > 0.5: 
			sprite.play("right")
			last_direction = "right"
			
		elif movement.x < -0.5: 
			sprite.play("left")
			last_direction = "left"
			
		elif movement.y > 0.5: 
			sprite.play("down")
			last_direction = "down"
			
		elif movement.y < -0.5: 
			sprite.play("up")
			last_direction = "up"
			
		else:
			if !last_direction: last_direction = "down"
			sprite.play(last_direction + "_2")
	
	else:
		if !last_direction: last_direction = "down"
		sprite.play(last_direction + "_2")
