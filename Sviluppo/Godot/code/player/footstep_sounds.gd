extends Node
class_name FootStepsSound

@onready var timer : Timer = $Timer
var sound_index : int = 0

func start()->void:
	timer.start()

func stop()->void:
	timer.stop()

func check_sound()->void:
	if get_child(sound_index) is AudioStreamPlayer:
		play_sound()
	else:
		sound_index = 0
		play_sound()

func play_sound()->void:
	get_child(sound_index).play()
	sound_index += 1
