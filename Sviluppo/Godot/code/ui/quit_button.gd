extends Button

@export var save_on_pressed : bool = true

func _on_pressed() -> void:
	if save_on_pressed:
		LevelsSaves.save_data()
	get_tree().quit()
