extends Camera3D
class_name PlayerCamera

@onready var project_ui_node : CameraProjectStrategy = $ProjectUI
var _custom_target : Vector3
func project_ui(item: Control)->void:
	project_ui_node.add_item(item)

func set_custom_target(new_target: Vector3)->void:
	_custom_target = new_target

func look_at_target()->void:
	look_at(_custom_target)
