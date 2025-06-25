extends Button

var hub_level_path : String = "res://levels/hub_level.tscn"

func _on_pressed() -> void:
	LevelsTransition.switch_level(hub_level_path)
