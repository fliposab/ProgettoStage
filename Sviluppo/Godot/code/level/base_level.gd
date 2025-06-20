extends Node3D
class_name Level

@onready var camera : Camera3D = $Camera3D
@onready var world_enviroment : WorldEnvironment = $WorldEnvironment
@onready var player_spawn : PlayerSpawn = $PlayerSpawn

func _ready():
	pass

func _on_player_spawn_player_spawned(player: Player) -> void:
	pass
