extends Node3D
class_name LevelTubeTransition

@export var load_level_path : String = "res://levels/linear_regression_level.tscn"
@onready var fade: FadeTransition = $Fade
@onready var level_title : Control = $LevelTitle

var is_inside : bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	level_title.show()
	is_inside = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if !body is Player:
		return
	level_title.hide()
	is_inside = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_inside:
		LevelsTransition.switch_level(load_level_path)
