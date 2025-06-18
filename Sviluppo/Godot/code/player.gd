extends CharacterBody3D
class_name Player

@export var speed : float = 1.0
@export var jump : float = 1.0

@onready var camera : Camera3D = $CameraRaycast/CameraTarget/SpringArm3D/Camera3D
@onready var _state_machine : StateMachine = $StateMachine

func _physics_process(delta: float) -> void:
	check_if_on_floor(delta)
	move_and_slide()

#da calcolare rotazione della telecamera
func ground_movement() -> Vector3:
	var movement : Vector3
	movement.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	movement.z = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	return movement * speed

func check_if_on_floor(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta * 3
