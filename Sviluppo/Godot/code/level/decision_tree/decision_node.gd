@abstract 
extends Node3D
class_name DecisionNode

@onready var _ui : Control = $Control
@onready var _mesh_instance : MeshInstance3D = $StaticBody3D/MeshInstance3D

var player : Player

func get_ui() -> Control:
	return _ui

func _on_area_3d_body_entered(_body: Node3D) -> void:
	return

func _on_area_3d_body_exited(_body: Node3D) -> void:
	return
