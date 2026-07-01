extends CanvasLayer
@onready var other: TextureRect = $Other
@onready var title: RichTextLabel = $Title
@onready var body: RichTextLabel = $Body
@onready var animation: AnimationPlayer = $animation

var can_move := true

signal advance

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("advance")
		

func talk(name: String, message: String):
	
	if name == "Nyra":
		title.add_theme_color_override("default_color", Color(0.0, 0.0, 0.0, 1.0))
	else:
		title.add_theme_color_override("default_color", Color(0.341, 0.0, 0.0, 1.0))
	
	can_move = false
	body.text = str(message)
	title.text = str(name)
	
	show()
	
	animation.play("type")
	await animation.animation_finished
	can_move = false
	
	await advance
	
	hide()
	can_move = true
	
	return

#func window(name: String, image: String):
	#face.show()
	#title.text = name
	#
	#if image == "" or image == null:
		#name = "General"
		#image = "default"
		#
	#var frank = "res://img/emotes/" + str(name) + "/" + str(image) + ".png"
	#
	#face.texture = load(frank)
	#
##func other_window(name: String, image: String):
	##title.text = name
	##
	##if image == "" or image == null:
		##name = "General"
		##image = "default"
		##
	##var frank = "res://img/emotes/" + str(name) + "/" + str(image) + ".png"
	##
	##other.texture = load(frank)
#
##func other_window_reset():
	##other.texture = load("")
