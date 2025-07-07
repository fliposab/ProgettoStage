extends SavesHandler
class_name DTSavesHandler

@export var breeds_unlocked : Array[bool] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func set_save_node()->void:
	_save_node = get_child(0)
