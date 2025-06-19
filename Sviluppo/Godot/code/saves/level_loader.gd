extends Node
class_name LevelLoader

func _ready():
	GlobalSaves.load_data()
	var level_path : String = GlobalSaves.current_level
	var level : Level = load(level_path).instantiate()
	await get_tree().create_timer(0.0166666666).timeout #????????????
	get_tree().get_root().add_child(level)
	await level.ready
	get_save_data(level)
	queue_free()

func get_save_data(level: Level):
	GlobalSaves.load_data()
	if GlobalSaves.last_player_position != Vector3.ZERO:
		level.player_spawn.global_position = GlobalSaves.last_player_position
