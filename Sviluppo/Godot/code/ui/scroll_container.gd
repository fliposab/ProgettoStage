extends ScrollContainer

func _ready()->void:
	return

func _on_dog_breed_sign_focus_grid() -> void:
	await get_tree().physics_frame
	scroll_vertical = 0
