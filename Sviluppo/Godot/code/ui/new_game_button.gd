extends Button

func _on_pressed() -> void:
	LevelsTransition.switch_level("res://levels/hub_level.tscn")
