extends Node3D
class_name DecisionTree

#signal send_data(id: int)
signal new_breed_unlocked(id: int)

var breeds_unlocked: Array[bool]

#func send_correct_data(id_number: int):
#	send_data.emit(id_number)
#	check_if_unlocked(id_number)

func check_if_unlocked(id_number: int)->void:
	if breeds_unlocked[id_number] == true:
		return
	else:
		breeds_unlocked[id_number] = true
		new_breed_unlocked.emit(id_number)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	breeds_unlocked = save_handler.breeds_unlocked
