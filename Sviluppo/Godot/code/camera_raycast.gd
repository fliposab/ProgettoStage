extends RayCast3D
class_name CameraRaycast

@onready var camera_target = $CameraTarget
@export_range(0.0, 1.0) var mouse_sensitivity = 0.01
@export var tilt_limit = deg_to_rad(75)

@onready var _camera_pivot : CameraTarget = $CameraTarget
@onready var _camera : Camera3D = $CameraTarget/SpringArm3D/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#Da cambiare
		_camera_pivot.rotation.x -= event.relative.y * mouse_sensitivity
		# Prevent the camera from rotating too far up or down.
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		_camera_pivot.rotation.y += -event.relative.x * mouse_sensitivity

func _physics_process(delta: float) -> void:
	camera_target.global_position =  get_collision_point() + Vector3(0.0,0.8,0.0)
