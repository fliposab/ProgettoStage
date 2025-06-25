@tool
extends Node3D
class_name TrainingData

@onready var mesh : Node3D = $Model

func _ready()->void:
	global_rotation.y = 0.0
	
func _physics_process(delta: float) -> void:
	mesh.rotate_y(2*PI*delta)
