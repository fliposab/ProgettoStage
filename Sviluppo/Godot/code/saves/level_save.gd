extends Node
class_name LevelSave

const SAVE_PATH = "user://levels_save.ini"

var stats : SavesHandler
var last_level : String

func save_data()->void:
	var config := ConfigFile.new()
	
	#config.set_value("common", "current_level", stats.owner.scene_file_path)
	#config.set_value("lr_level", "collectibles_taken", stats.collectibles_taken)
	
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	#last_level = config.get_value("common", "current_level")
	#stats.collectibles_taken = load_var(stats.collectibles_taken, config, "lr_level", "collectibles_taken")

func save_dt_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("dt_level", "breeds_unlocked", stats.breeds_unlocked)
	
	config.save(SAVE_PATH)

func load_dt_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	stats.breeds_unlocked = load_var(stats.breeds_unlocked, config, "dt_level", "breeds_unlocked")
	
func load_last_level()->void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	#last_level = config.get_value("common", "current_level")
	
func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
