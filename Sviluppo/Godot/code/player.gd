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

var grab_item : Node3D
var can_grab : bool = false
var is_holding : bool = false
var hold_item : Node3D

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

func set_grab_item(body: Node3D)->void:
	grab_item = body
	if body:
		can_grab = true
	else:
		can_grab = false

func set_hold_item(body: Node3D)->void:
	hold_item = body
	
func carry()->void:
	#_bone_attachment.add_child(grab_item)
	grab_item.move_node(_bone_attachment)
	grab_item.holding = true

func release()->void:
	#_bone_attachment.remove_child(grab_item)
	hold_item.move_node(hold_item.og_parent, false)
	hold_item.holding = false

func reset_grab_item(body: Node3D) -> void:
	await get_tree().process_frame
	grab_item = null
	can_grab = false

func change_collectibles_max_value(value: int)->void:
	_collectibles.change_max(value)

func set_camera_current(value: bool):
	_camera.current = value

func lock_camera(value: bool)->void:
	if value:
		_camera_raycast.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		_camera_raycast.process_mode = Node.PROCESS_MODE_INHERIT
