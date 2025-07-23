extends Node3D

func emit_particles()->void:
	for i in get_child_count():
		get_child(i).emitting = true
