extends Node3D
class_name InteractableArea

##Base class for every interactable object in the game

##The command prompt
@onready var ui : Control = $Control
##The area the player needs to be inside to interact
@onready var area : Area3D = $Area3D

##true when the player is inside
var is_inside : bool = false
##The player
var player : Player

func get_ui()->Control:
	return ui

func set_ui(new_ui: Control)->void:
	ui = new_ui

##Hides ui and connects signals
func _ready()->void:
	ui.hide()
	connect_signals()

##Abstract class for connecting custom signals
func connect_signals()->void:
	return

##Activated when the player enters
func _on_area_3d_body_entered(body: Node3D) -> void:
	if !body is Player:
		return
	player = body
	ui.show()
	is_inside = true

##Activated when the player exits
func _on_area_3d_body_exited(body: Node3D) -> void:
	if !body is Player:
		return
	ui.hide()
	is_inside = false

##Detect the input
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and check_if_can_talk():
		_on_interact_button_pressed()
	elif event.is_action_pressed("interact_go_back") and \
	is_inside and player.get_current_state_name() == "Interact":
		_on_go_back_button_pressed()

##Checks if the player isn't busy, grabbing an object or is not already in the "Interact" state
func check_if_can_talk()->bool:
	return is_inside and !(player.grab_item.can_grab_item() or\
	player.grab_item.can_release_item())\
	and player.get_current_state_name() != "Interact"\
	and !get_tree().paused

##Abstract function, emitted when the interact button is pressed
func _on_interact_button_pressed()->void:
	return

##Abstract function, emitted when the go back button is pressed
func _on_go_back_button_pressed()->void:
	return
