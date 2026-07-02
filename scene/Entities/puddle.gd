extends StaticBody2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var drip: AudioStreamPlayer2D = $drip

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	
	await t.talk("Nyra", "I guess scientists aren't great plumbers.")
	
func _process(delta: float) -> void:
	if sprite_2d.frame == 2:
		if !drip.playing:
			drip.play()
