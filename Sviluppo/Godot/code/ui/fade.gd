extends Control
class_name FadeTransition

func play_fade(reverse: bool = false):
	if !reverse:
		$AnimationPlayer.play("fade")
	else:
		$AnimationPlayer.queue("fade_reverse")
