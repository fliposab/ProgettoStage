extends State

func enter(previous_state_path, _msg:={})->void :
	player.lock_camera(true)

func physics_update(delta: float)->void:
	player.velocity = Vector3.ZERO

func exit()->void:
	player.lock_camera(false)
