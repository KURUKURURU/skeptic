extends StaticBody2D

@export var tag: String
@export var message: String

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact_name = tag 
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("Nyra", message)
