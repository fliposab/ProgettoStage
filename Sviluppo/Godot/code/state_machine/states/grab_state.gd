extends State
class_name GrabState

func enter(_previous_state_path, _msg:={})->void :
	player.grab_item.carry()
	player.play("grab")
	$Timer.start()

func physics_update(_delta: float)->void:
	player.velocity = Vector3.ZERO

func _on_timer_timeout() -> void:
	finished.emit("Idle")
