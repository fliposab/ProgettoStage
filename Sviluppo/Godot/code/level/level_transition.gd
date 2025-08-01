extends Node
class_name LevelTransition

var current_level : Node
var changing : bool = false
var to_change : String
@onready var fade_transition : FadeTransition = $Fade

func _ready():
	for i in get_tree().get_root().get_child_count():
		if get_tree().get_root().get_child(i) is Level:
			current_level = get_tree().get_root().get_child(i)
			break

func switch_level(new_level_path: String):
	to_change = new_level_path
	changing = true
	if current_level is Level and current_level.saves_handler:
		current_level.saves_handler.save_data()
	fade_transition.play_fade()
	get_tree().paused = false
	await get_tree().create_timer(1.0).timeout
	get_tree().get_root().remove_child(current_level)
	if current_level:
		current_level.call_deferred("free")
	var new_level = load(new_level_path).instantiate()
	get_tree().get_root().add_child(new_level)
	current_level = new_level
	if current_level.saves_handler:
		current_level.saves_handler.debug_mode = false
	fade_transition.play_fade(true)
	changing = false

"""
func load_last_level():
	fade_transition.play_fade()
	get_tree().paused = false
	await get_tree().create_timer(1.0).timeout
	get_tree().get_root().remove_child(current_level)
	current_level.call_deferred("free")
	#var new_level = load(LevelsSaves.last_level).instantiate()
	#get_tree().get_root().add_child(new_level)
	#current_level = new_level
	fade_transition.play_fade(true)
"""
func new_game()->void:
	fade_transition.play_fade()
	get_tree().paused = false
	await get_tree().create_timer(1.0).timeout
	get_tree().get_root().remove_child(current_level)
	current_level.call_deferred("free")
	var new_level = preload("res://levels/tutorial_level.tscn").instantiate()
	get_tree().get_root().add_child(new_level)
	current_level = new_level
	fade_transition.play_fade(true)
