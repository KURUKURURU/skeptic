extends CanvasLayer

@onready var other: TextureRect = $Other
@onready var title: RichTextLabel = $Title
@onready var body: RichTextLabel = $Body
@onready var animation: AnimationPlayer = $animation
@onready var zap: AudioStreamPlayer = $zap
@onready var box: NinePatchRect = $Box
@onready var box_2: NinePatchRect = $Box2
@onready var array: Node2D = $Array

var can_move := true
var array_visible := false
var answer : int

signal advance
signal finished

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	answer = array.answer
	
	if Input.is_action_just_pressed("ui_accept") and !array_visible:
		emit_signal("advance")

func talk(name: String, message: String):
	if name == "Nyra":
		title.add_theme_color_override("default_color", Color(0.0, 0.0, 0.0, 1.0))
	else:
		title.add_theme_color_override("default_color", Color(0.341, 0.0, 0.0, 1.0))
	
	can_move = false
	body.text = str(message)
	title.text = str(name)
	
	zap.play()
	animation.play("type")
	show()
	await animation.animation_finished
	can_move = false
	finished.emit()
	
	await advance 
	
	hide()
	can_move = true
	return

func tune_option(option_number: int, message: String):
	array.tune(option_number, message)

func options(amount: int):
	show()
	array.show()
	array_visible = true
	await array._ask(amount)
	array_visible = false
	array.hide()
	#hide()

func _on_array_advance() -> void:
	advance.emit()
