extends Camera3D
class_name PlayerCamera

@onready var project_ui_node : CameraProjectStrategy = $ProjectUI

func project_ui(item: Control)->void:
	project_ui_node.add_item(item)
