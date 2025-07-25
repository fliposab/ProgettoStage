extends OptionsButton

@onready var value_label : Label = $Value
var value : float = 0.8
var check_inputs : bool = false

func _on_option_button_value_changed(new_value: float) -> void:
	value = maxf(0.0, new_value)
	value = minf(1.0, value)
	value_label.set_text("%d"%(value*100)+"%")
	option_button.value = value
	change_volume()
	pass_value.emit("volume",value)

func change_volume()->void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))

func check_selected_item(saves_handler: SavesHandler):
	_on_option_button_value_changed(saves_handler.volume)

func _on_button_focus_entered() -> void:
	check_inputs = true
	$OptionButton.add_theme_stylebox_override("grabber", preload("res://ui/styles/grabber_focus_style.tres"))

func _on_button_focus_exited() -> void:
	check_inputs = false
	$MenuScrollSound.play()
	$OptionButton.remove_theme_stylebox_override("grabber")

func _input(event: InputEvent) -> void:
	if check_inputs:
		if event.is_action("ui_right"):
			_on_option_button_value_changed(value+0.01)
		elif event.is_action("ui_left"):
			_on_option_button_value_changed(value-0.01)
