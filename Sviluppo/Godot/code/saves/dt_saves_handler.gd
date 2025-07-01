extends SavesHandler
class_name DTSavesHandler

@export var breeds_unlocked : Array[bool] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func set_save_node()->void:
	_save_node = LevelsSaves

func load_data():
	_save_node.load_dt_data()

func save_data():
	_save_node.save_dt_data()
