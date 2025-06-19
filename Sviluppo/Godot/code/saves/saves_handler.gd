extends Node
class_name SavesHandler

@export var debug_mode : bool = 0
var save_node
	
func save_data():
	save_node.save_data()

func load_data():
	save_node.load_data()

func change_var(name: String, value):
	set(name, value)

func _ready()->void:
	set_save_node()
	save_node.stats = self
	if !debug_mode:
		load_data()

func set_save_node()->void:
	return
