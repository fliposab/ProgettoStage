extends Control
class_name ProjectText

func _ready()->void:
	hide()
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	body.get_camera().project_ui(self)
	show()

func _on_area_3d_body_exited(body: Node3D) -> void:
	hide()
