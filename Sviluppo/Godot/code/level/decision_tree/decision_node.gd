extends Node3D
class_name DecisionNode

@onready var _ui : Control = $Control
@onready var _mesh_instance : MeshInstance3D = $StaticBody3D/MeshInstance3D
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	return

func _on_area_3d_body_exited(body: Node3D) -> void:
	return
