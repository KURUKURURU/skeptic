extends CanvasLayer
@onready var borders: TextureRect = $Borders
@onready var img: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	hide()
	borders.show()
	
	#t.talk(true, "Hi!")
 

func _process(delta: float) -> void:
	if visible:
		t.can_move = false
	else:
		t.can_move = true

func scene(name: String):
	
	match name:
		"Test":
			await __test()

func __test():
	show()
	img.play("default")
	await t.talk(true, "Hey, what?")
	img.frame += 1
	await t.talk(true, "Anyways...")
	hide()
