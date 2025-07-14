extends Node
class_name LevelSave


var stats : SavesHandler

func save_data()->void:
	return

func load_data() -> void:
	return

func check_save_exist()->bool:
	return true
	"""var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return false
	return true"""
	
func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
