extends Node3D
class_name DecisionNode

@export var id : String 
@export var is_final : bool = false
@onready var ui : Control = $Control

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is TrainingImage:
		if is_final and body.id == id:
			#play_effect
			return
		elif is_final:
			#play
			body.return_to_spawn()
			return
	else:
		ui.show()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		ui.hide()
