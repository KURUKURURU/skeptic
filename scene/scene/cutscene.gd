extends CanvasLayer
@onready var borders: TextureRect = $Borders
@onready var img: AnimatedSprite2D = $AnimatedSprite2D

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
			
	hide()
	t.can_move = true

func __test():
	img.play("default")
	await t.talk("Nyra", "Hey, what?")
	img.frame += 1
	await t.talk("Nyra", "Anyways...")
	await wait(1.0)
	
func __frontdesk():
	img.play("default")
	await t.talk("Nyra", "Time for the night shift.")
	img.frame += 1
	await t.talk("Nyra", "Anyways...")
	await wait(1.0)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
