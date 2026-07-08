extends CanvasLayer
@onready var borders: TextureRect = $Borders
@onready var img: AnimatedSprite2D = $AnimatedSprite2D
@onready var black: ColorRect = $ColorRect
@onready var animation: AnimationPlayer = $ColorRect/AnimationPlayer
@onready var wind: AudioStreamPlayer = $wind

func _ready() -> void:
	hide()
	borders.show()
	
	#t.talk(true, "Hi!")
 
func scene(name: String):
	show()
	# match the name of your desired scene 
	match name:
		"Test":
			await __test()
			
		"Open":
			await __open()
			
	hide()
	t.can_move = true

func __test():
	img.play("default")
	await t.talk("Nyra", "Hey, what?", 0)
	img.frame += 1
	await t.talk("Nyra", "Anyways...", 0)
	await wait(1.0)
	
func __open():
	wind.play()
	img.play("open")
	animation.play("off")
	await animation.animation_finished
	await wait(3.0)
	await t.talk("[i]???", "You added a new secretary, yes?", 0)
	await t.talk("???", "Yeah, and did the usual background check. She's clean, and has years worth of references.", 0)
	await t.talk("[i]???", "Remember the last girl.", 0)
	await t.talk("[i]???", "I don’t need to clean a mess like that again.", 0)
	await t.talk("Doctor", "That was a rare incident, and I have made the necessary preparations against it happening again.", 0)
	await t.talk("[i]???", "How?", 0)
	await t.talk("Doctor", "I have subcontracted workers from a trusted ally of our work. ", 0)
	await t.talk("Doctor", "Their people have experience in all branches of industry, and can keep secrets.", 0)
	await t.talk("Doctor", "Security, tech experts, even secretaries.", 0)
	
	narrate()
	await t.talk("", "[color=white]In a swift gesture, the man directs the Doctor’s eyes to his. They are eerily still. Staring far through the Doctor, and through the wall behind him.", 0)
	t.box.show()
	await t.talk("[i]???", "Keep an eye out, Doctor. They’re always out to get you,", 0)
	
	narrate()
	await t.talk("", "[color=white]The man leans forward.", 0)
	t.box.show()
	await t.talk("[i]???", "Scaling an operation, you’ll always have to keep that truth tucked neat when meeting anyone.", 0)
	await t.talk("Doctor", "Yes. I believe you’re right.", 0)
	await t.talk("[i]???", "In the 20th Century, only the paranoid survive.", 0)
	
	await wait(2.0)
	
	animation.play("on")
	await animation.animation_finished
	wind.stop()
	
	await wait(1.0)

func __frontdesk():
	img.play("default")
	await t.talk("Nyra", "Time for the night shift.")
	img.frame += 1
	await t.talk("Nyra", "Anyways...")
	await wait(1.0)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func narrate():
	
	t.box.hide()
	t.box_2.show()
	
	await t.advance
	
	t.box_2.hide()
