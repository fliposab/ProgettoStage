extends Area3D
class_name FallArea

@onready var timer : Timer = $Timer
@onready var anim_player : AnimationPlayer = $Control/AnimationPlayer
@onready var fade : Control = $Fade

func _on_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	var player : Player = body
	timer.start()
	fade.play_fade()
	await timer.timeout
	respawn_player(player)

func respawn_player(player: Player)->void:
	player.return_to_respawn_point()
	fade.play_fade(true)
