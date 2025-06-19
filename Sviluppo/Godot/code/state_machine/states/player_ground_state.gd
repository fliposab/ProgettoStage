extends State

func enter(previous_state_path, _msg:={})->void :
	player.set_respawn_point()

func physics_update(delta: float)->void:
	player.get_move_input(delta, 0.1)
	player.rotate_model_direction()
	if Input.is_action_just_pressed("jump"):
		finished.emit("Air", {jump = true})
