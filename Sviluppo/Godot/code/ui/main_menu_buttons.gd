extends VBoxContainer
class_name MainMenuButtons

signal new_game()
signal load_game()

func _ready():
	get_child(0).grab_focus()

func _on_new_game_pressed() -> void:
	new_game.emit()

func _on_load_game_pressed() -> void:
	load_game.emit()
