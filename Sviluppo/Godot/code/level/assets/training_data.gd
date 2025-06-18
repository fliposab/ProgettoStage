@tool
extends Node3D
class_name TrainingData

@onready var mesh : MeshInstance3D = $MeshInstance3D

func _physics_process(delta: float) -> void:
	mesh.rotate_y(2*PI*delta)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if not body is Player:
		return
	var player : Player = body
	player.add_collectibles(1)
	queue_free()
