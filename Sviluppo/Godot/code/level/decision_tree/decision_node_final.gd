extends DecisionNode
class_name DecisionNodeFinal

@export var id : String:
	get():
		return id

@onready var _ui_answer : UIAnswer = $UIAnswer
@onready var ui_position : Marker3D = $UIPosition

var _is_correct : bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is TrainingImage:
		check_if_correct(body)
	elif body is Player:
		player = body

func check_if_correct(body: Node3D):
	if body.id == id:
		_is_correct = true
		owner.send_correct_data(body.id_number)
		if player:
			_ui_answer.show_correct(player.get_camera())
	else:
		_is_correct = false
		if player:
			_ui_answer.show_wrong(player.get_camera())

func get_is_correct()->bool:
	return _is_correct
