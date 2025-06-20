extends Node
class_name OptionsSave

const SAVE_PATH = "user://options_save.ini"

var stats : SavesHandler

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "window_mode", stats.window_mode)
	config.set_value("common", "window_resolution", stats.window_resolution)
	config.set_value("common", "resolution_scale", stats.resolution_scale)
	config.set_value("common", "anti_aliasing", stats.anti_aliasing)
	config.set_value("common", "shadows_quality", stats.shadows_quality)
	config.set_value("common", "max_fps", stats.max_fps)
	
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	stats.window_mode = load_var(stats.window_mode, config, "common", "window_mode")
	stats.window_resolution = load_var(stats.window_resolution, config, "common", "window_resolution")
	stats.resolution_scale = load_var(stats.resolution_scale, config, "common", "resolution_scale")
	stats.anti_aliasing = load_var(stats.anti_aliasing, config, "common", "anti_aliasing")
	stats.shadows_quality = load_var(stats.shadows_quality, config, "common", "shadows_quality")
	stats.max_fps = load_var(stats.max_fps, config, "common", "max_fps")


func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
