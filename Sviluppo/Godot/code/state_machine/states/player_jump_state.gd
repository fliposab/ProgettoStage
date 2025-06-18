extends State

func enter(previous_state_path, _msg:={})->void :
	player.velocity.y += player.jump

func physics_update(delta: float)->void:
	if player.is_on_floor():
		finished.emit("Ground")
