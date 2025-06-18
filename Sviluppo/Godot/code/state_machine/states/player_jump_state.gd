extends State

func enter(previous_state_path, _msg:={})->void :
	if _msg.has("jump"):
		player.velocity.y += player.jump

func physics_update(delta: float)->void:
	player.get_move_input(delta, 0.03)
	if player.is_on_floor():
		finished.emit("Ground")
