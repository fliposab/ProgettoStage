extends DecisionNode
class_name DecisionNodeFinal

@export var _id : String:
	get():
		return _id

var _is_correct : bool = false:
	get():
		return _is_correct
	set(value):
		_is_correct = value
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is TrainingImage:
		check_if_correct(body)

func check_if_correct(body: Node3D):
	if body.id == _id:
		_is_correct = true
	else:
		_is_correct = false
