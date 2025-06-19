extends SavesHandler
class_name PlayerSavesHandler

@export var red_training_data_count : int = 0
@export var blue_training_data_count : int = 0
@export var green_training_data_count : int = 0

func set_save_node():
	save_node = PlayerSaves
