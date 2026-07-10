extends StaticBody2D

@onready var animation: AnimatedSprite2D = $elevator
@onready var sfx = $AudioStreamPlayer2D
@onready var level: AnimatedSprite2D = $level


func open():
	animation.play("open")
	sfx.play()
	await animation.animation_finished
	print("opened")
	return

func close():
	animation.play("close")
	sfx.play()
	await animation.animation_finished
	print("closed")
	return

func set_level(_level: int):
	var _string = str(_level)
	level.play(str(_level))
	await level.animation_finished
	return
