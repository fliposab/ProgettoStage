extends VBoxContainer
class_name PauseButtons

signal resume_game()

func get_first_button_focus():
	get_child(0).grab_focus()

func _on_resume_button_pressed():
	resume_game.emit()
