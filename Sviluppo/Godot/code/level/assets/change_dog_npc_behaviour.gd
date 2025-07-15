extends Node
class_name ChangeDogNPCBehaviour

signal reset_dogs

func _on_dialogue_ended_correct() -> void:
	$Fade.play_fade()
	await get_tree().create_timer(0.5).timeout
	$Fade.play_fade(true)
	reset_dogs.emit()
