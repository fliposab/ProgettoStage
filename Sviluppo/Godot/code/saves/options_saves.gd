extends Saves
class_name OptionsSave

func _ready()->void:
	save_path ="./options_save.ini"

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "window_mode", stats.window_mode)
	config.set_value("common", "window_resolution", stats.window_resolution)
	config.set_value("common", "resolution_scale", stats.resolution_scale)
	config.set_value("common", "anti_aliasing", stats.anti_aliasing)
	config.set_value("common", "shadows_quality", stats.shadows_quality)
	config.set_value("common", "max_fps", stats.max_fps)
	config.set_value("common", "language", stats.language)
	config.set_value("common", "volume", stats.volume)
	
	config.save(save_path)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(save_path)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(save_path)
	
	stats.window_mode = config.get_value("common", "window_mode", stats.window_mode)
	stats.window_resolution = config.get_value("common", "window_resolution", stats.window_resolution)
	stats.resolution_scale = config.get_value("common", "resolution_scale", stats.resolution_scale)
	stats.anti_aliasing = config.get_value("common", "anti_aliasing", stats.anti_aliasing)
	stats.shadows_quality = config.get_value("common", "shadows_quality", stats.shadows_quality)
	stats.max_fps = config.get_value("common", "max_fps", stats.max_fps)
	stats.language = config.get_value("common", "language", stats.language)
	stats.volume = config.get_value("common", "volume", stats.volume)
