@tool
extends Node3D

func _physics_process(delta: float) -> void:
	$Cube_004.rotate_y(PI/4*delta)
