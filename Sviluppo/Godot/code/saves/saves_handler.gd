extends Node
class_name SavesHandler

@export var debug_mode : bool = 0
var _save_node
	
signal data_saved(save_handler: SavesHandler)
signal data_loaded(save_handler: SavesHandler)

func save_data():
	_save_node.save_data()
	data_saved.emit(self)

func load_data():
	_save_node.load_data()
	data_loaded.emit(self)

func change_var(name: String, value):
	set(name, value)

func _ready()->void:
	set_save_node()
	_save_node.stats = self
	if !debug_mode:
		load_data()

func set_save_node()->void:
	return
