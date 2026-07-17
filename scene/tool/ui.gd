extends CanvasLayer
@onready var animation: AnimationPlayer = $animation

func fade(_in: bool):
	match _in:
		true:
			animation.play("in")
		false:
			animation.play("away")
			
	await animation.animation_finished
	return
