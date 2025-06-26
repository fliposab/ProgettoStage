extends MeshInstance3D

@export var speed : Vector2 = Vector2(1.5, 1.0)
@export var tilt_limit : float = deg_to_rad(75)

@onready var ray_cast : RayCast3D = $Camera3D/RayCast3D

signal add_point(point_position: Vector3)
signal exit()
signal reset_graph()

func _ready()->void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _physics_process(delta: float) -> void:
	rotation.y += (Input.get_action_strength("rotate_camera_left")\
	- Input.get_action_strength("rotate_camera_right")) * delta * speed.y
	rotation.x = clampf(rotation.x, -tilt_limit, tilt_limit)
	rotation.x += -(Input.get_action_strength("rotate_camera_down")\
	- Input.get_action_strength("rotate_camera_up")) * delta * speed.x

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and ray_cast.is_colliding():
		add_point.emit(ray_cast.get_collision_point())
	elif event.is_action_pressed("interact_go_back"):
		rotation = Vector3.ZERO
		exit.emit()
	elif event.is_action_pressed("interact_reset"):
		reset_graph.emit()
