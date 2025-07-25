extends SavesHandler
class_name PlayerSavesHandler

@export var data : Dictionary = {
	"red_count":0,
	"blue_count":0,
	"green_count":0,
}

func set_save_node():
	_save_node = get_child(0)

func set_red_training_data(value: int)->void:
	if value > data["red_count"]:
		data.set("red_count", value)
		save_data()

func set_green_training_data(value: int)->void:
	if value > data["green_count"]:
		data.set("green_count", value)
		save_data()
	
func set_blue_training_data(value: int)->void:
	if value > data["blue_count"]:
		data.set("blue_count", value)
		save_data()
