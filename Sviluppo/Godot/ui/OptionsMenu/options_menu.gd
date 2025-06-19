extends Control
class_name OptionsMenu

func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		hide_menu()

func hide_menu():
	hide()
