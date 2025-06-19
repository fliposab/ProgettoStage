extends Area3D
class_name FallArea

func _on_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	var player : Player = body
	#player.return_to_last_point()
