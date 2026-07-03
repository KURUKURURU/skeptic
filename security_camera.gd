extends Node2D
@export var player : Node2D
@onready var sprite: AnimatedSprite2D = $Sprite2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("Nyra", "They're watching me.")

func _process(_delta):
	if not is_instance_valid(player):
		return
		
	var target = player.global_position
	var angle = global_position.angle_to_point(target)
	var angle_deg = rad_to_deg(angle)
	
	# Split into 3 zones: Left, Down, and Right
	if angle_deg > 45 and angle_deg < 135:
		sprite.play("down")   # Player is below the camera
	elif angle_deg >= 135 or angle_deg <= -45:
		sprite.play("left")   # Player is to the left of the camera
	else:
		sprite.play("right")  # Player is to the right of the camera
