extends Node3D
class_name Level

@onready var world_enviroment : WorldEnvironment = $WorldEnvironment
@onready var player_spawn : PlayerSpawn = $PlayerSpawn
@onready var pause_menu : PauseMenu = $PauseMenu
@onready var saves_handler : SavesHandler = $SavesHandler

var collectibles_count : int

func _on_player_spawn_player_spawned(player: Player) -> void:
	await get_tree().process_frame
	player.change_collectibles_max_value(collectibles_count)

func _ready()->void:
	collectibles_count = get_tree().get_nodes_in_group("collectibles").size()
	print(tr("RESUME"))
