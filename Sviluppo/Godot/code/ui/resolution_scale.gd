extends OptionsButton

@onready var value_label : Label = $Value
var value : float = 0.8
var check_inputs : bool = false

func _on_option_button_value_changed(new_value: float) -> void:
	value = maxf(0.3, new_value)
	value = minf(1.0, value)
	value_label.set_text("%.1f"%value)
	option_button.value = value
	change_resolution_scale()
	pass_value.emit("resolution_scale",value)

func change_resolution_scale()->void:
	get_viewport().scaling_3d_scale = value
	
func check_selected_item(saves_handler: SavesHandler):
	_on_option_button_value_changed(saves_handler.resolution_scale)
	_on_option_button_value_changed(saves_handler.resolution_scale)

func _on_button_focus_entered() -> void:
	check_inputs = true

func _on_button_focus_exited() -> void:
	check_inputs = false

func _input(event: InputEvent) -> void:
	if check_inputs:
		if event.is_action_pressed("ui_right"):
			_on_option_button_value_changed(value+0.1)
		elif event.is_action_pressed("ui_left"):
			_on_option_button_value_changed(value-0.1)
