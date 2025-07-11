extends OptionsButton

func _on_item_selected(index: int) -> void:
	match index:
		0: #60
			Engine.max_fps = 60
		1: #40
			Engine.max_fps = 40
		2: #30
			Engine.max_fps = 30
	pass_value.emit("max_fps",index+1)

func check_selected_item(saves_handler) -> void:
	_on_item_selected(saves_handler.max_fps-1)
	set_selected_item(saves_handler.max_fps-1)
