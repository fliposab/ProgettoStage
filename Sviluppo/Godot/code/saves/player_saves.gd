extends Saves
class_name PlayerSave

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "red_training_data_count", stats.red_training_data_count)
	config.set_value("common", "blue_training_data_count", stats.blue_training_data_count)
	config.set_value("common", "green_training_data_count", stats.green_training_data_count)

	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	stats.red_training_data_count = load_var(stats.red_training_data_count, config, "common", "red_training_data_count")
	stats.blue_training_data_count = load_var(stats.blue_training_data_count, config, "common", "blue_training_data_count")
	stats.green_training_data_count = load_var(stats.green_training_data_count, config, "common", "green_training_data_count")

func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
