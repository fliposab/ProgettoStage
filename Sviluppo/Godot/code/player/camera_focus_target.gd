##Handles the change of the target and moves the camera accordingly
##Example: the camera movement in a Dialogue
extends Node
class_name CameraFocusTarget

var target: Vector3
var zoom_value : float:
	set(value):
		zoom_value = value

func _ready()->void:
	activate(false)

func _physics_process(delta: float) -> void:
	owner.lerp_on_target(target, zoom_value) 

func set_target(new_target: Vector3)->void:
	target = new_target

func zoom_in(value: float)->void:
	zoom_value = value

func activate(value: bool)->void:
	if value:
		process_mode = Node.PROCESS_MODE_PAUSABLE
	else:
		process_mode = Node.PROCESS_MODE_DISABLED
