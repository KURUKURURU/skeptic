extends StaticBody2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var drip: AudioStreamPlayer2D = $drip

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("Nyra", "This doesn't really speak to me.")
