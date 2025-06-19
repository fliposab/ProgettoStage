extends Marker3D
class_name LastCheckPoint

func _on_timer_timeout() -> void:
	global_position = owner.global_poisition
