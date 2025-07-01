@tool
extends DecisionNode
class_name DecisionNodeIntermediate

@onready var right_direction_label : Label = $Control/VBoxContainer/HBoxContainer/RightDirection
@onready var center_direction_label : Label = $Control/VBoxContainer/HBoxContainer/CenterDirection
@onready var left_direction_label : Label = $Control/VBoxContainer/HBoxContainer/LeftDirection

@export var _question_text : String
@export var left_text : String
@export var right_text : String
@export var center_text : String

func _ready()->void:
	_ui.hide()
	$Control/VBoxContainer/Label.text = _question_text
	show_directions()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if !body is TrainingImage:
		_ui.show()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		_ui.hide()

func show_directions()->void:
	left_direction_label.text = "← " + left_text
	right_direction_label.text = "→ " + right_text
	center_direction_label.text = "↑ " + center_text
	if center_text == "":
		center_direction_label.hide()
