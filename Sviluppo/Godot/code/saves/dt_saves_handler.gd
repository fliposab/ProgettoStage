extends SavesHandler
class_name DTSavesHandler

@export var breeds_unlocked : Array[bool] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func set_save_node()->void:
	_save_node = get_child(0)

func _on_decision_tree_new_breed_unlocked(id: int) -> void:
	breeds_unlocked[id] = true
	save_data()
