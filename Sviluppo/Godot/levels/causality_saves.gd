extends Saves
class_name  CausalitySaves

const SAVE_PATH = "./causality_save.ini"

func save_data()->void:
	var config := ConfigFile.new()
	config.set_value("causality", "data", stats.data)
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	stats.data = load_var(stats.data, config, "causality", "data")
