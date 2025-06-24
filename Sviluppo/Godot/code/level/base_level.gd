extends Node3D
class_name Level

@onready var world_enviroment : WorldEnvironment = $WorldEnvironment
@onready var player_spawn : PlayerSpawn = $PlayerSpawn
@onready var pause_menu : PauseMenu = $PauseMenu

func _on_player_spawn_player_spawned(player: Player) -> void:
	pass
