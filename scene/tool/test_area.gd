extends Node2D
var bus_bg = AudioServer.get_bus_index("bg")

func _ready() -> void:
	AudioServer.set_bus_mute(bus_bg, true)
	await Cutscene.scene("Open")
	AudioServer.set_bus_mute(bus_bg, false)
	
	Music._play("lounge")
	Ui.show()
	


func _process(delta: float) -> void:
	pass
