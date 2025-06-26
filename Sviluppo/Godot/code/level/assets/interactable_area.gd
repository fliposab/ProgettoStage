extends Node3D
class_name InteractableArea

@onready var ui : Control = $Control

var is_inside : bool = false
var player : Player

func _ready()->void:
	ui.hide()
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	player = body
	ui.show()
	is_inside = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if !body is Player:
		return
	ui.hide()
	is_inside = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_inside:
		_on_interact_button_pressed()

func _on_interact_button_pressed()->void:
	return
