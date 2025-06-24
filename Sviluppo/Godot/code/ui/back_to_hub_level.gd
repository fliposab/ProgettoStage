extends Button

@export var hub_level : PackedScene = preload("res://levels/hub_level.tscn")

func _on_pressed() -> void:
	LevelsTransition.switch_level(hub_level.instantiate())
