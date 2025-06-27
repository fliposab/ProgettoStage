extends State

func enter(previous_state_path, _msg:={})->void :
	player.play("release")
	player.can_grab = false
	$Timer.start()

func physics_update(delta: float)->void:
	player.velocity = Vector3.ZERO

func _on_timer_timeout() -> void:
	finished.emit("Idle")

func exit():
	player.release()
	player.can_grab = true
	player.is_holding = false
	player.set_hold_item(null)
