extends OptionsButton

func _on_item_selected(index: int) -> void:
	match index:
		0: #Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	pass_value.emit("window_mode",index+1)

func check_selected_item(saves_handler) -> void:
	_on_item_selected(saves_handler.window_mode-1)
	set_selected_item(saves_handler.window_mode-1)
