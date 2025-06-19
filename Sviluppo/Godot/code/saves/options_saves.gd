extends Node
class_name OptionsSave

const SAVE_PATH = "user://options_save.ini"

var window_mode : int = 0
var window_resolution : Vector2i = Vector2i(1280, 720)
var resolution_scale : float = 1.0
var anti_aliasing : int = 1

var stats : SavesHandler

func save_data()->void:
	var config := ConfigFile.new()
	
	config.set_value("common", "window_mode", stats.window_mode)
	config.set_value("common", "window_resolution", window_resolution)
	config.set_value("common", "resolution_scale", resolution_scale)
	config.set_value("common", "anti_aliasing", anti_aliasing)
	config.set_value("common", "shadows_quality", stats.shadows_quality)
	
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	
	window_mode = load_var(window_mode, config, "common", "window_mode")
	window_resolution = load_var(window_resolution, config, "common", "window_resolution")
	resolution_scale = load_var(resolution_scale, config, "common", "resolution_scale")
	anti_aliasing = load_var(anti_aliasing, config, "common", "anti_aliasing")
	stats.shadows_quality = load_var(stats.shadows_quality, config, "common", "shadows_quality")

func load_var(value, config: ConfigFile, section: String, key: String):
	if config.get_value(section, key):
		return config.get_value(section, key)
	else:
		return value
