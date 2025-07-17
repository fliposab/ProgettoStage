extends SavesHandler
class_name PlayerSavesHandler

@export var data : Dictionary = {
	"red_training_data_count":0,
	"blue_training_data_count":0,
	"green_training_data_count":0,
}

signal td_changed(red: int, blue: int, green: int)

func set_save_node():
	_save_node = get_child(0)

func set_red_training_data(value: int)->void:
	if value > data["red_training_data_count"]:
		data.set("red_training_data_count", value)
		save_data()

func set_green_training_data(value: int)->void:
	if value > data["green_training_data_count"]:
		data.set("green_training_data_count", value)
		save_data()
	
func set_blue_training_data(value: int)->void:
	if value > data["blue_training_data_count"]:
		data.set("blue_training_data_count", value)
		save_data()

func load_data():
	_save_node.load_data()
	td_changed.emit(data["red_training_data_count"],\
	data["green_training_data_count"],\
	data["blue_training_data_count"])
