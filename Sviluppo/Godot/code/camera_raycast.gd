extends RayCast3D
class_name CameraRaycast

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
		_camera_pivot.rotate_automatically(delta, owner.model.global_rotation.y)
		_spring_arm.global_rotation.x = lerp_angle(_spring_arm.global_rotation.x, deg_to_rad(-10.0), 0.007)
	else:
		_camera_pivot.rotate_on_input(delta)

func calculate_position()->void:
	if is_colliding():
		_camera_pivot.calculate_position(get_collision_point())
	else:
		_camera_pivot.calculate_position(Vector3.ZERO)

func respawn(point: Vector3)->void:
	_camera_pivot.respawn(point)

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
