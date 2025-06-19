extends Node
class_name GlobalSave

const SAVE_PATH = "user://global_save.ini"

@export var last_player_position: Vector3 = Vector3.ZERO
@export var current_level: String = "res://mainscenes/rock/cave_level.tscn"

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "position", last_player_position)
	config.set_value("common", "level", current_level)
	
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	last_player_position = load_var(last_player_position, config, "common", "position")
	current_level = load_var(current_level, config, "common", "level")

func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
