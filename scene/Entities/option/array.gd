extends Node2D
@export var amount := 1
@onready var container: VBoxContainer = $container

@onready var text_1: Button = $container/Option1/Button
@onready var text_2: Button = $container/Option2/Button
@onready var text_3: Button = $container/Option3/Button
@onready var text_4: Button = $container/Option4/Button

@export var textbox : CanvasLayer

var children 
var answer: int 

signal advance

func _ready() -> void:
	children = container.get_children()
	reset() # Keep choices hidden on start
	
	text_1.pressed.connect(_on_option_selected.bind(1))
	text_2.pressed.connect(_on_option_selected.bind(2))
	text_3.pressed.connect(_on_option_selected.bind(3))
	text_4.pressed.connect(_on_option_selected.bind(4))
	
func _on_option_selected(option_number: int) -> void:
	print("Player selected option: ", option_number)
	answer = option_number
	advance.emit() 

func tune(option_number: int, message: String):
	match option_number:
		1: text_1.text = message
		2: text_2.text = message
		3: text_3.text = message
		4: text_4.text = message

func _ask(options_amount: int):
	reset()
	
	if textbox.animation.is_playing():
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
		if option is Control:
			option.hide()
