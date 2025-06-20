extends OptionsButton

func _on_item_selected(index: int) -> void:
	match index:
		0:
			get_viewport().msaa_3d = 2
			get_viewport().screen_space_aa = 0
		1:
			get_viewport().msaa_3d = 1
			get_viewport().screen_space_aa = 0
		2:
			get_viewport().msaa_3d = 0
			get_viewport().screen_space_aa = 1
		3:
			get_viewport().screen_space_aa = 0
			get_viewport().msaa_3d = 0
	pass_value.emit("anti_aliasing",index+1)

func check_selected_item(saves_handler: SavesHandler):
	_on_item_selected(saves_handler.anti_aliasing-1)
	set_selected_item(saves_handler.anti_aliasing-1)
