extends Node
class_name Saves

@export var SAVE_PATH = "user://global_save.ini"

var stats : SavesHandler

func save_data()->void:
	return

func load_data() -> void:
	return

func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
