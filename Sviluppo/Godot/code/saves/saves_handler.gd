extends Node
class_name SavesHandler

@export var debug_mode : bool = 0
var _save_node: Saves
	
signal data_saved(save_handler: SavesHandler)
signal data_loaded(save_handler: SavesHandler)

func save_data():
	_save_node.save_data(self)
	data_saved.emit(self)

func load_data():
	if !debug_mode:
		_save_node.load_data(self)
	data_loaded.emit(self)

func change_var(var_name: String, value):
	set(var_name, value)

func _ready()->void:
	set_save_node()
	#_save_node.stats = self
	load_data()

func set_save_node()->void:
	return
