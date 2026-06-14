extends CanvasLayer
@onready var face: TextureRect = $Face
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
	
	title.text = str(name)
	body.text = str(message)
	
	show()
	
	animation.play("type")
	await animation.animation_finished
	
	can_move = false
	await advance
	
	hide()
	can_move = true
	return
