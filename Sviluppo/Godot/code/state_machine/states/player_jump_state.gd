extends State
class_name InteractState

var falling : bool = false

func enter(_previous_state_path, msg:={})->void :
	falling = false
	if msg.has("jump"):
		$JumpSound.play()
		player.particle_emitter.load_jump_particles()
		player.velocity.y += player.jump
		if player.grab_item.is_holding:
			player.play("jump_grab")
		else:
			player.play("jump")
	else:
		falling = true
		if player.grab_item.is_holding:
			player.play("fall_still_grab")
		else:
			player.play("fall_still")
		

func physics_update(delta: float)->void:
	if player.velocity.y < 0.0 and !falling:
		if player.grab_item.is_holding:
			player.play("fall_grab")
		else:
			player.play("fall")
		falling = true
	player.get_move_input(delta, 0.03)
	if player.is_on_floor():
		finished.emit("Idle")
