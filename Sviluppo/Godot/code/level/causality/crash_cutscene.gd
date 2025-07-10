extends Node3D
class_name CrashCutscene

@onready var path_follow : PathFollow3D = $PathNPC/PathFollow3D
@onready var camera : Camera3D = $Camera3D
@onready var timer : Timer = $Timer
@onready var fade : FadeTransition = $Fade
@onready var ice_cream_shop : Node3D = $ice_cream_shop

var player : Player

signal start_cutscene()
signal save_dialogue()

func start(trigger: Player, play_cutscene: bool)->void:
	start_cutscene.emit()
	if !play_cutscene:
		return
	player = trigger
	player.change_state("Interact")
	fade.play_fade()
	await get_tree().create_timer(1.0).timeout
	camera.current = true
	fade.play_fade(true)
	await get_tree().create_timer(1.0).timeout
	path_follow.start(true)
	timer.start()

func _on_timer_timeout() -> void:
	camera.current = false
	player.change_state("Idle")

func _on_correct_option_selected() -> void:
	save_dialogue.emit()
