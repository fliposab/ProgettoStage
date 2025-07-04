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
	if is_inside and !(player.grab_item.can_grab_item() or\
	player.grab_item.can_release_item()) and event.is_action_pressed("interact"):
		_on_interact_button_pressed()
	elif event.is_action_pressed("interact_go_back") and \
	is_inside and player.get_current_state_name() == "Interact":
		_on_go_back_button_pressed()

func _on_interact_button_pressed()->void:
	return

func _on_go_back_button_pressed()->void:
	return
