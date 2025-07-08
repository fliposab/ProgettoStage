extends SavesHandler
class_name PlayerSavesHandler

@export var red_training_data_count : int = 0
@export var blue_training_data_count : int = 0
@export var green_training_data_count : int = 0

signal td_changed(red: int, blue: int, green: int)
func set_save_node():
	_save_node = get_child(0)

func set_red_training_data(value: int)->void:
	if value > red_training_data_count:
		red_training_data_count = value
		save_data()

func set_green_training_data(value: int)->void:
	if value > green_training_data_count:
		green_training_data_count = value
		save_data()
	
func set_blue_training_data(value: int)->void:
	if value > blue_training_data_count:
		blue_training_data_count = value
		save_data()

func load_data():
	_save_node.load_data()
	td_changed.emit(red_training_data_count, green_training_data_count, blue_training_data_count)
