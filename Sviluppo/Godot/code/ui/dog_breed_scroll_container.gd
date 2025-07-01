extends ScrollContainer

func _on_visibility_changed() -> void:
	await get_tree().process_frame
	scroll_vertical = 0
