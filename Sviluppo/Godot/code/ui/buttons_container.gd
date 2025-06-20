extends VBoxContainer
class_name OptionsButtons

@onready var description : RichTextLabel = $Description

func _on_visibility_changed() -> void:
	if visible:
		get_child(0).grab_button_focus()

func change_description(text: String) -> void:
	description.text = text
