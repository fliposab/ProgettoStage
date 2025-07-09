extends RayCast3D
class_name CameraRaycast

@export var tilt_limit = deg_to_rad(75)
@export var speed : Vector2 = Vector2(1.0, 1.0)
@export var offset : Vector3 = Vector3(0.0, 0.65, 0.0)

@onready var _camera_pivot : CameraTarget = $CameraTarget
@onready var _camera : Camera3D = $CameraTarget/SpringArm3D/Camera3D
@onready var _spring_arm : SpringArm3D = $CameraTarget/SpringArm3D
@onready var _focus_target : CameraFocusTarget = $FocusTarget

var is_locked : bool = false

func _ready()->void:
	await get_tree().process_frame
	_camera_pivot.global_rotation.y = owner.model.global_rotation.y

#da aggiustare
func _physics_process(delta: float) -> void:
	if is_locked:
		return
	calculate_position()
	if (abs(owner.velocity.x) >= 0.1 or abs(owner.velocity.z) >= 0.1)\
	and !(Input.is_action_pressed("rotate_camera_down") or\
	Input.is_action_pressed("rotate_camera_up") or\
	Input.is_action_pressed("rotate_camera_right") or\
	Input.is_action_pressed("rotate_camera_left")):
		_camera_pivot.global_rotation.y = lerp_angle(_camera_pivot.global_rotation.y, owner.model.global_rotation.y, 0.007)
		_spring_arm.global_rotation.x = lerp_angle(_spring_arm.global_rotation.x, deg_to_rad(-10.0), 0.007)
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
	else:
		_camera_pivot.rotation.y += (Input.get_action_strength("rotate_camera_left")\
		- Input.get_action_strength("rotate_camera_right")) * delta * speed.y
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		_camera_pivot.rotation.x -= -(Input.get_action_strength("rotate_camera_down")\
		- Input.get_action_strength("rotate_camera_up")) * delta * speed.x

func calculate_position() -> void:
	var focus_point: Vector3
	if is_colliding():
		focus_point =  get_collision_point() + offset
	else:
		focus_point = global_position + Vector3(0.0, target_position.y, 0.0) + offset
	_camera_pivot.global_position.y = lerp(_camera_pivot.global_position.y, focus_point.y, 0.05)
	_camera_pivot.global_position.x = focus_point.x
	_camera_pivot.global_position.z = focus_point.z

func respawn(point: Vector3)->void:
	_camera_pivot.global_position.y = point.y

func reset(keep_rotation : bool = false)->void:
	if !keep_rotation:
		_camera_pivot.global_rotation.y = owner.model.global_rotation.y
		_camera_pivot.global_rotation.x = deg_to_rad(-15.0)
	_spring_arm.spring_length = 8.0
	_camera.look_at(_camera_pivot.global_position)
	_camera.rotation.z = 0.0
	_focus_target.activate(false)

func reposition_camera(target: Vector3)->void:
	_camera.set_custom_target(target + Vector3(0.0,0.7,0.0))
	_camera.rotation.z = 0.0
	_focus_target.activate(true)
	_focus_target.set_target(target)
	_focus_target.zoom_in(5.0)

func zoom_in(value: float):
	_focus_target.zoom_in(value)
	
func lerp_on_target(lerp_target: Vector3, zoom_value: float):
	_spring_arm.spring_length = lerp(_spring_arm.spring_length, zoom_value, 0.3)
	_camera.look_at_target()
	set_focus_rotation()

func set_focus_rotation():
	_spring_arm.global_rotation.x = lerp_angle(_spring_arm.global_rotation.x, deg_to_rad(-5.0), 0.3)
