extends Control
class_name MainMenu

@onready var fade : Control = $Fade

func _on_main_menu_buttons_load_game() -> void:
	pass # Replace with function body.

func _on_main_menu_buttons_new_game() -> void:
	var level : Level
	fade.play_fade()
	#await level.ready
	fade.play_fade(true)
	await get_tree().create_timer(1.0).timeout
	queue_free()

func hide_transition()->void:
	for i in get_child_count()-1:
		get_child(i).hide()
