extends InteractableArea
class_name NPC

#@onready var _ui : Control = $Control
@onready var ui_position : Marker3D = $UIPosition
@onready var _model : NPCModel = $Model

@export var talk_on_enter : bool = true

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
	if talk_on_enter:
		_model.start_talking(player)

func model_area_exited():
	if talk_on_enter:
		_model.stop_talking()

func connect_signals()->void:
	area.body_entered.connect(ui.on_area_3d_body_entered)
	area.body_entered.connect(ui.on_area_3d_body_exited)
