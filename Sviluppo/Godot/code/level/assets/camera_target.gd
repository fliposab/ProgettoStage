extends Marker3D
class_name CameraTarget

@export var tilt_limit = deg_to_rad(75)
@export var speed : Vector2 = Vector2(1.0, 1.0)
@export var offset : Vector3 = Vector3(0.0, 2.0, 0.0)

func calculate_position(point: Vector3) -> void:
	var focus_point: Vector3
	focus_point = point + offset
	global_position.y = lerp(global_position.y, focus_point.y, 0.05)
	global_position.x = focus_point.x
	global_position.z = focus_point.z

func rotate_on_input(delta: float)-> void:
		rotation.y += (Input.get_action_strength("rotate_camera_left")\
		- Input.get_action_strength("rotate_camera_right")) * delta * speed.y
		rotation.x = clampf(rotation.x, -tilt_limit, tilt_limit)
		rotation.x -= -(Input.get_action_strength("rotate_camera_down")\
		- Input.get_action_strength("rotate_camera_up")) * delta * speed.x

func rotate_automatically(delta: float, target_rotation: float)->void:
	global_rotation.y = lerp_angle(global_rotation.y, target_rotation, 0.007)
	rotation.x = clampf(rotation.x, -tilt_limit, tilt_limit)
	
func respawn(point: Vector3)->void:
	global_position.y = point.y
