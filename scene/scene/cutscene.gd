extends CanvasLayer
@onready var borders: TextureRect = $Borders
@onready var img: AnimatedSprite2D = $AnimatedSprite2D
@onready var black: ColorRect = $ColorRect
@onready var animation: AnimationPlayer = $ColorRect/AnimationPlayer

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
	await t.talk("Nyra", "Hey, what?")
	img.frame += 1
	await t.talk("Nyra", "Anyways...")
	await wait(1.0)
	
func __open():
	img.play("open")
	animation.play("off")
	await animation.animation_finished
	await wait(3.0)
	await t.talk("[i]???", "You added a new secretary, yes?")
	await t.talk("???", "Yeah, and did the usual background check. She's clean, and has years worth of references.")
	await t.talk("[i]???", "Remember the last girl.")
	await t.talk("[i]???", "I don’t need to clean a mess like that again.")
	await t.talk("Doctor", "That was a rare incident, and I have made the necessary preparations against it happening again.")
	await t.talk("[i]???", "How?")
	await t.talk("Doctor", "I have subcontracted workers from a trusted ally of our work. ")
	await t.talk("Doctor", "Their people have experience in all branches of industry, and can keep secrets.")
	await t.talk("Doctor", "Security, tech experts, even secretaries.")
	
	narrate()
	await t.talk("", "[color=white]In a swift gesture, the man directs the Doctor’s eyes to his. They are eerily still. Staring far through the Doctor, and through the wall behind him.")
	
	await t.talk("[i]???", "Keep an eye out, Doctor. They’re always out to get you,")
	
	narrate()
	await t.talk("", "[color=white]The man leans forward.")
	
	await t.talk("[i]???", "Scaling an operation, you’ll always have to keep that truth tucked neat when meeting anyone.")
	await t.talk("Doctor", "Yes. I believe you’re right.")
	await t.talk("[i]???", "In the 20th Century, only the paranoid survive.")
	
	await wait(2.0)
	
	animation.play("on")
	await animation.animation_finished
	
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
	
	t.box2.hide()
