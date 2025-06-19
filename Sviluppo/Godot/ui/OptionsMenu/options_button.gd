extends HBoxContainer
class_name OptionsButton

@onready var label : Label = $Label
@onready var option_button : OptionButton = $OptionButton

func _on_focus_entered() -> void:
	option_button.grab_focus()

func grab_button_focus() -> void:
	option_button.grab_focus()
