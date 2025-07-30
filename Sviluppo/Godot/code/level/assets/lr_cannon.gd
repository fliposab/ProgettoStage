extends InteractableArea
class_name LRCannon

@export var graph : LinearRegressionGraph

@onready var camera : Camera3D = $cannon_lr/cannon/Camera3D
@onready var cannon_mesh : MeshInstance3D = $cannon_lr/cannon
@onready var _lr_scope_ui : Control = $LRScope
@onready var animation_player : AnimationPlayer = $Control/VBoxContainer/AnimationPlayer

func _ready()->void:
	ui.hide()
	_lr_scope_ui.hide()
	
func _on_interact_button_pressed()->void:
	cannon_mesh.process_mode = Node.PROCESS_MODE_INHERIT
	graph.process_mode = Node.PROCESS_MODE_INHERIT
	$ConfirmSound.play()
	graph.resize_line(0.05)
	camera.current = true
	player.change_state("Interact")
	_lr_scope_ui.show()
	ui.hide()

func _on_cannon_add_point(point_position: Vector3) -> void:
	$PlacePointGraphSound.play()
	graph.add_point(point_position)
	cannon_mesh.rand_rotation()

func _on_cannon_exit() -> void:
	camera.current = false
	player.set_camera_current(true)
	ui.show()
	graph.resize_line(1.5)
	player.model.global_rotation.y = global_rotation.y
	player.global_position = Vector3(global_position.x, global_position.y + 0.4, global_position.z)
	player.change_state("Idle", {"reset_camera" : true})
	_lr_scope_ui.hide()
	$ConfirmSound.play()
	graph.process_mode = Node.PROCESS_MODE_DISABLED
	cannon_mesh.process_mode = Node.PROCESS_MODE_DISABLED

func _on_cannon_reset_graph() -> void:
	graph.reset_points()
	$ResetGraphSound.play()
