extends RayCast3D
class_name CameraRaycast

@export var tilt_limit = deg_to_rad(75)
@export var speed : Vector2 = Vector2(1.0, 1.0)
@export var offset : Vector3 = Vector3(0.0, 0.8, 0.0)

@onready var _camera_pivot : CameraTarget = $CameraTarget
@onready var _camera : Camera3D = $CameraTarget/SpringArm3D/Camera3D

func _physics_process(delta: float) -> void:
	calculate_position()
	_camera_pivot.rotation.y -= (Input.get_action_strength("rotate_camera_left")\
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
	_camera_pivot.global_position.y = lerp(_camera_pivot.global_position.y, focus_point.y, 0.15)
