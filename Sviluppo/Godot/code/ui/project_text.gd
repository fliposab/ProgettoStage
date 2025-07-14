extends Control
class_name ProjectText

@export var label_text : String 

func _ready()->void:
	$Label.text = tr(label_text)
	hide()
	
func on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		body.get_camera().project_ui(self)
		show()

func on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		body.get_camera().remove_ui(self)
		hide()

func _on_draw() -> void:
	$Label.text = tr(label_text)
