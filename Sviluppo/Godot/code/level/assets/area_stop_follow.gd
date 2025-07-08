extends Area3D
class_name AreaStopFollow

func _on_body_entered(body: Node3D) -> void:
	if !body is FollowNPC:
		return
	body.on_stop_following()
	body.start_timer()
