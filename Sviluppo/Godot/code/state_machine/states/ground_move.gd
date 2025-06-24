extends State

func enter(previous_state_path, _msg:={})->void :
	player.play("run")

func physics_update(delta: float)->void:
	player.get_move_input(delta, 0.1)
	player.rotate_model_direction()
	if !player.is_moving():
		finished.emit("Idle")
		return
	if Input.is_action_just_pressed("jump"):
		finished.emit("Air", {jump = true})
		return
	if !player.is_on_floor():
		finished.emit("Air")
		return
