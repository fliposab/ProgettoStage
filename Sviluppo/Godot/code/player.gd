extends CharacterBody3D
class_name Player

@export var speed : float = 1.0
@export var jump : float = 1.0

@onready var _camera : Camera3D = $CameraRaycast/CameraTarget/SpringArm3D/Camera3D
@onready var _state_machine : StateMachine = $StateMachine
@onready var _camera_raycast : CameraRaycast = $CameraRaycast
@onready var _spring_arm : SpringArm3D = $CameraRaycast/CameraTarget/SpringArm3D
@onready var _collectibles : PlayerCollectibles = $Misc/Collectibles
@onready var model : Node3D = $Model
@onready var _model_player : AnimationPlayer = $Model/AnimationPlayer
@onready var _respawn_point : RespawnPoint = $RespawnPoint
@onready var _movement_node : PlayerMovement = $Misc/Movement
@onready var _bone_attachment : BoneAttachment3D = $Model/Armature/Skeleton3D/BoneAttachment3D
@onready var grab_item : GrabItem = $Misc/GrabItem:
	get():
		return grab_item

func _physics_process(delta: float) -> void:
	check_if_on_floor(delta)
	move_and_slide()

func check_if_on_floor(delta: float) -> void:
	if !is_on_floor():
		velocity -= -get_gravity() * delta * 3

func get_move_input(delta: float, weight: float):
	_movement_node.get_move_input(delta, weight)
	
func add_collectibles(value: int)->void:
	_collectibles.add(value)

func rotate_model_direction()->void:
	if !velocity.is_zero_approx():
		model.global_rotation.y = atan2(-velocity.x,-velocity.z)

func set_respawn_point():
	_respawn_point.set_respawn_position()

func return_to_respawn_point():
	global_position = _respawn_point.global_position
	_camera_raycast.respawn(global_position)

func get_spring_arm():
	return _spring_arm

func play(animation: String):
	_model_player.play(animation)
	
func queue(animation: String):
	_model_player.queue(animation)

func is_moving() -> bool:
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	return input != Vector2.ZERO

func reset_camera() -> void:
	_camera_raycast.reset()

func change_state(state: String, msg := {})->void:
	_state_machine.transition_to(state, msg)

func change_collectibles_max_value(value: int)->void:
	_collectibles.change_max(value)

func set_camera_current(value: bool):
	_camera.current = value

func get_camera()->Camera3D:
	return _camera

func lock_camera(value: bool)->void:
	if value:
		_camera_raycast.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		_camera_raycast.process_mode = Node.PROCESS_MODE_INHERIT

func face(object: Node3D)->void:
	model.look_at(object.global_position)
	model.global_rotation.x = 0.0
	model.global_rotation.z = 0.0

func get_bone_attachment()->BoneAttachment3D:
	return _bone_attachment
