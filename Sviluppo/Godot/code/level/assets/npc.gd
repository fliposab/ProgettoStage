extends InteractableArea
class_name NPC

@onready var _ui : Control = $Control
@onready var ui_position : Marker3D = $UIPosition
@onready var _model : NPCModel = $Model

func _on_area_3d_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	player = body
	ui.show()
	is_inside = true
	model_area_entered()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if !body is Player:
		return
	ui.hide()
	is_inside = false
	model_area_exited()

func model_area_entered():
	_model.start_talking(player)

func model_area_exited():
	_model.stop_talking()
