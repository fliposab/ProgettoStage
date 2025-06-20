extends Button
class_name OpenOptionsButton

@onready var options_menu : Control = $OptionsMenu

signal exit_options()

func _on_pressed() -> void:
	options_menu.show()
