@tool
extends Node3D
class_name TrainingData

@onready var mesh : Node3D = $Model

func _ready()->void:
	global_rotation = Vector3.ZERO
	
func _physics_process(delta: float) -> void:
	mesh.rotate_y(2*PI*delta)
