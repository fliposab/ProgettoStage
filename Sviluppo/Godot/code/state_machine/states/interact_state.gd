extends State

func enter(_previous_state_path, _msg:={})->void :
	player.lock_camera(true)
	player.play("idle")

func physics_update(_delta: float)->void:
	player.velocity = Vector3.ZERO

func exit()->void:
	player.lock_camera(false)
