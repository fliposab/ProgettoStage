extends Node3D
class_name CrashCutscene

@onready var path_follow : PathCutscene = $PathNPC/PathFollow3D
@onready var camera : Camera3D = $Camera3D
@onready var timer : Timer = $Timer
@onready var fade : FadeTransition = $Fade
@onready var ice_cream_shop : Node3D = $ice_cream_shop

var cutscene_handler : CutscenesHandler
var started : bool = false
var done : bool = false

signal start_cutscene()
signal change_values()
signal change_specific_values()

func start(play_cutscene: bool)->void:
	if !play_cutscene:
		change_values.emit()
		done = true
		return
	started = true
	fade.play_fade()
	emit_change_values()
	await get_tree().create_timer(1.0).timeout
	start_cutscene.emit()
	camera.current = true
	fade.play_fade(true)
	await get_tree().create_timer(1.0).timeout
	timer.start()

func _on_timer_timeout() -> void:
	camera.current = false
	started = false
	cutscene_handler.cutscene_finish()

func emit_change_values() -> void:
	change_values.emit()

func emit_change_specific_values(save_handler: SavesHandler) -> void:
	if save_handler is CausalitySavesHandler\
	and save_handler.check_array():
		change_specific_values.emit()
