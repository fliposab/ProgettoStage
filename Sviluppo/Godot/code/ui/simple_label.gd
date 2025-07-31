extends Control
class_name SimpleProjectLabel
	
@export var label_text : String
@onready var label : Label = $Label

func on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		body.get_camera().project_ui(self)
		show()

func on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		body.get_camera().remove_ui(self)
		hide()

func _on_draw() -> void:
	set_label_text()

func set_label_text():
	label.text = tr(label_text)
