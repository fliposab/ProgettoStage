extends State

func enter(previous_state_path, _msg:={})->void :
	player.particle_emitter.start_run_particles()
	if player.grab_item.is_holding:
		player.play("run_grab")
	else:
		player.play("run")

func exit()->void:
	player.particle_emitter.start_run_particles(false)

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
	if Input.is_action_just_pressed("interact") and \
	player.grab_item.can_grab_item():
		finished.emit("Grab")
		return
	if Input.is_action_just_pressed("interact") and \
	player.grab_item.can_release_item():
		finished.emit("Release")
		return
