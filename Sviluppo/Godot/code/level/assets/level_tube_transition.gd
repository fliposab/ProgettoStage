extends InteractableArea
class_name LevelTubeTransition

@export var load_level_path : String = "res://levels/linear_regression_level.tscn"
@onready var fade: FadeTransition = $Fade

func _on_interact_button_pressed()->void:
	LevelsTransition.switch_level(load_level_path)
