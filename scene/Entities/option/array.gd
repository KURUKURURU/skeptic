extends Node2D
@export var amount := 1
@onready var container: VBoxContainer = $container

@onready var text_1: Control = $container/Option1/Button
@onready var text_2: Control = $container/Option2/Button
@onready var text_3: Control = $container/Option3/Button
@onready var text_4: Control = $container/Option4/Button

@export var textbox : CanvasLayer

var children 

signal advance

func _ready() -> void:
	children = container.get_children()
		
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#advance.emit()

func tune(option_number: int, message: String):
	match option_number:
		1: text_1.text = message
		2: text_2.text = message
		3: text_3.text = message
		4: text_4.text = message

func _ask(options_amount: int):
	reset()
	
	await textbox.finished
	amount = options_amount
	var shown := 0
	
	for option in children:
		if shown < amount:
			option.show()
			shown += 1
		else:
			break
	
	await advance
	reset()
	
	
func reset():
	for option in children:
		option.hide()
