extends Saves
class_name DTLevelSave

func save_data(stats: SavesHandler)->void:
	var config := ConfigFile.new()
	config.set_value("dt_level", "breeds_unlocked", stats.breeds_unlocked)
	config.save(save_path)

func load_data(stats: SavesHandler) -> void:
	var config := ConfigFile.new()
	var err = config.load(save_path)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(save_path)
	
	stats.breeds_unlocked = config.get_value("dt_level", "breeds_unlocked", stats.breeds_unlocked)
