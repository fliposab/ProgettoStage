extends Node3D
class_name Level

@onready var world_enviroment : WorldEnvironment = $WorldEnvironment
@onready var player_spawn : PlayerSpawn = $PlayerSpawn
@onready var pause_menu : PauseMenu = $PauseMenu
@onready var saves_handler : SavesHandler = $SavesHandler

@export var red_collectibles : bool = false
@export var green_collectibles : bool = false
@export var blue_collectibles : bool = false
@export var reset_collectibles_on_load : bool = true

func _on_player_spawn_player_spawned(player: Player) -> void:
	await get_tree().process_frame
	player.show_collectibles_count(red_collectibles,green_collectibles,blue_collectibles)
	reset_collectibles(player)

func reset_collectibles(player: Player)->void:
	if reset_collectibles_on_load:
		player.reset_collectibles_count()
