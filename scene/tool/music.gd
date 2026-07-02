extends Node2D
@onready var lounge: AudioStreamPlayer = $LoungeMusic



func _play(name):
	
	match name:
		"lounge":
			lounge.play()
