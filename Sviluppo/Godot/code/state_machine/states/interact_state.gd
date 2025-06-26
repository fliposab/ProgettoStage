extends State

func enter(previous_state_path, _msg:={})->void :
	pass

func physics_update(delta: float)->void:
	player.velocity = Vector3.ZERO
