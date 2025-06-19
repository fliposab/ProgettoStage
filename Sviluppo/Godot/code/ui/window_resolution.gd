extends OptionsButton

func _on_item_selected(index: int) -> void:
	match index:
		0: #1280x720
			DisplayServer.window_set_size(Vector2i(1280,720))
		1: #1920x1080
			DisplayServer.window_set_size(Vector2i(1920,1080))
