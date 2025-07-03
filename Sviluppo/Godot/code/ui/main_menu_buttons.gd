extends VBoxContainer
class_name MainMenuButtons

signal new_game()
signal load_game()

func _ready():
	if !LevelsSaves.check_save_exist():
		get_child(0).hide()
		get_child(1).grab_focus()
		return
	get_child(0).grab_focus()

func _on_new_game_pressed() -> void:
	LevelsTransition.switch_level("res://levels/hub_level.tscn")

func _on_load_game_pressed() -> void:
	load_game.emit()

func _on_options_exit_options() -> void:
	if get_child(0).visible:
		get_child(0).grab_focus()
	else:
		get_child(1).grab_focus()
