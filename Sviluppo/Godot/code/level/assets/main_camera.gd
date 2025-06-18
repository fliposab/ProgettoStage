extends Camera3D
class_name MainCamera

var target : Node3D 
var smooth_speed: float
var offset: Vector3

@export var offset_x: float = 0
@export var offset_y: float = 0.5
@export var offset_z: float = 30

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	pass

func _on_player_spawn_player_spawned(player: Player) -> void:
	target = player.camera_target
