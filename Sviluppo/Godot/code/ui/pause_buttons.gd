extends VBoxContainer
class_name PauseButtons

signal resume_game()

func get_first_button_focus():
	get_child(0).grab_focus()

func _on_resume_button_pressed():
	resume_game.emit()

func _on_options_pressed() -> void:
	owner.on_top = false

func _on_options_exit_options() -> void:
	owner.on_top = true

func _on_hub_level_pressed() -> void:
	return
