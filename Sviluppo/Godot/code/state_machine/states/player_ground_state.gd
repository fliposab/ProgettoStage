extends State

func enter(previous_state_path, _msg:={})->void :
	if _msg.has("reset_camera"):
		player.reset_camera()
	player.play("idle")
	player.set_respawn_point()

func physics_update(delta: float)->void:
	player.velocity.x = lerp(player.velocity.x, 0.0, 0.1)
	player.velocity.z = lerp(player.velocity.z, 0.0, 0.1)
	if player.is_moving():
		finished.emit("GroundMove")
		return
	if Input.is_action_just_pressed("jump"):
		finished.emit("Air", {jump = true})
		return
	if !player.is_on_floor():
		finished.emit("Air")
		return
