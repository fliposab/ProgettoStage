extends InteractableArea
class_name LevelTubeTransition

@export var load_level_path : String = "res://levels/linear_regression_level.tscn"
@onready var fade: FadeTransition = $Fade

signal transition_started()

func _on_interact_button_pressed()->void:
	transition_started.emit()
	LevelsTransition.switch_level(load_level_path)
