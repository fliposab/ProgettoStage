extends State

func enter(previous_state_path, _msg:={})->void :
	return

func physics_update(delta: float)->void:
	var input_movement : Vector3 = owner.ground_movement() * delta
	owner.velocity.x = lerp(owner.velocity.x, input_movement.x, 0.1)
	owner.velocity.z = lerp(owner.velocity.z, input_movement.z, 0.1)
	
	if Input.is_action_just_pressed("jump"):
		finished.emit("Jump")
