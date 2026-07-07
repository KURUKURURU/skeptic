extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var path_follow: PathFollow2D 
@export var path: Path2D 

@export var move_speed: float = 100.0
@export var loop_path: bool = false
@export var moving: bool = true

var last_position : Vector2
var last_direction : String

func _ready() -> void:
	last_position = position
	
func _physics_process(delta: float) -> void:
	path_follow.progress += move_speed * delta
	
	var movement = position - last_position
	if movement.length() > 0.1: 
		_update_animation(movement) 
		
	last_position = position

func _update_animation(movement: Vector2):
	# Using the cleaner line format we discussed to fix the if/else overlaps
	var anim_name := (
		"right" if movement.x > 0.5  
		else "left" if movement.x < -0.5
		else "down" if movement.y > 0.5
		else "up" if movement.y < -0.5
		else last_direction
	)
	
	last_direction = anim_name
	
	# If the NPC is supposed to be moving, play the walking animation
	if moving:
		sprite.play(anim_name)
	else:
		sprite.play(anim_name + "_2")
