extends Node2D
@onready var label = $A/Label

var current_interactions := []
var can_interact := true

func _on_interactable_area_entered(area: Area2D) -> void: # enters an area
	current_interactions.push_back(area)

func _on_interactable_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact: #button pressed
		if current_interactions: #there's stuff in range
			can_interact = false
			label.hide()
			
			await current_interactions[0].interact.call()
			
			can_interact = true

func _process(_delta: float) -> void:
	if current_interactions and can_interact:
		current_interactions.sort_custom(_sort_by_nearest)
		if current_interactions[0].is_interactable:
			label.text = current_interactions[0].interact_name
			label.show()
	else:
		label.hide()
	
func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist
