extends VBoxContainer
class_name OptionsButtons

func _on_visibility_changed() -> void:
	if visible:
		get_child(0).grab_button_focus()
