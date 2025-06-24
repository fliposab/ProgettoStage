extends Node
class_name LevelTransition

var current_level : Level
@onready var fade_transition : FadeTransition = $Fade

func _ready():
	for i in get_tree().get_root().get_child_count():
		if get_tree().get_root().get_child(i) is Level:
			current_level = get_tree().get_root().get_child(i)
			break

func switch_level(new_level: Level):
	fade_transition.play_fade()
	get_tree().paused = false
	await get_tree().create_timer(1.1).timeout
	get_tree().get_root().remove_child(current_level)
	current_level.call_deferred("free")
	get_tree().get_root().add_child(new_level)
	current_level = new_level
	fade_transition.play_fade(true)
	
	
