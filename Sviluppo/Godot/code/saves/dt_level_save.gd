extends LevelSave
class_name DTLevelSave

const SAVE_PATH = "./decision_tree_save.ini"

func save_data()->void:
	var config := ConfigFile.new()
	config.set_value("dt_level", "breeds_unlocked", stats.breeds_unlocked)
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	stats.breeds_unlocked = load_var(stats.breeds_unlocked, config, "dt_level", "breeds_unlocked")
