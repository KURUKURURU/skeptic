extends Node2D


func _ready() -> void:
	#await Cutscene.scene("Test")
	Music._play("lounge")
	Ui.show()
	


func _process(delta: float) -> void:
	pass
