extends Marker3D
class_name RespawnPoint

var waiting_on_floor : bool = false

func _on_timer_timeout() -> void:
	if owner.is_on_floor():
		set_respawn_position()
	else:
		waiting_on_floor = true

func set_respawn_position() -> void:
	global_position = owner.global_position
	global_rotation = owner.model.global_rotation
	waiting_on_floor = false
