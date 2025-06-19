extends OptionsButton

func _on_item_selected(index: int) -> void:
	match index:
		0:
			RenderingServer.directional_shadow_atlas_set_size(4096, false)
		1:
			RenderingServer.directional_shadow_atlas_set_size(2048, false)
		2:
			RenderingServer.directional_shadow_atlas_set_size(1024, true)
		3:
			RenderingServer.directional_shadow_atlas_set_size(512, true)
	pass_value.emit("shadows_quality",index+1)

func check_selected_item(saves_handler: SavesHandler):
	_on_item_selected(saves_handler.shadows_quality-1)
