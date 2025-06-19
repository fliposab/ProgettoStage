extends Node
class_name PlayerSave

const SAVE_PATH = "user://global_save.ini"

var red_training_data_count: int = 0
var blue_training_data_count: int = 0
var green_training_data_count: int = 0

var stats : SavesHandler

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "red_training_data_count", red_training_data_count)
	config.set_value("common", "blue_training_data_count", blue_training_data_count)
	config.set_value("common", "green_training_data_count", green_training_data_count)

	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	red_training_data_count = load_var(red_training_data_count, config, "common", "red_training_data_count")
	blue_training_data_count = load_var(blue_training_data_count, config, "common", "blue_training_data_count")
	green_training_data_count = load_var(green_training_data_count, config, "common", "green_training_data_count")

func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
