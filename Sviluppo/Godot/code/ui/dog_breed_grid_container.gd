extends GridContainer

func _on_dog_breed_sign_focus_grid() -> void:
	get_child(0).grab_focus()

func _on_dog_breed_sign_unlock_dog(id: int) -> void:
	get_child(id).unlock()
