extends InteractableArea
class_name NPC

##Base class for Non Playable Characters.
##Used for animated models that show a projected text box when near them.

##The position where the textbox needs to be projected
@onready var ui_position : Marker3D = $UIPosition
##The 3D model of the NPC
@onready var _model : NPCModel = $Model

##Set if the model needs to change animation when entering
@export var talk_on_enter : bool = true:
	set(value):
		talk_on_enter = value

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

##Check if the NPC needs to play the animation when the player enters the area
func model_area_entered():
	if talk_on_enter:
		_model.start_talking(player)

##Check if the NPC needs to play the animation when the player exits the area
func model_area_exited():
	if talk_on_enter:
		_model.stop_talking()

func connect_signals()->void:
	area.body_entered.connect(ui.on_area_3d_body_entered)
	area.body_exited.connect(ui.on_area_3d_body_exited)

func get_model():
	return _model
