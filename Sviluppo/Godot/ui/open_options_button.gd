extends Button
class_name OpenOptionsButton

@onready var options_menu : Control = $OptionsMenu

func _on_pressed() -> void:
	options_menu.show()
