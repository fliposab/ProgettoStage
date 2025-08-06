extends Node3D
class_name DecisionTree

signal new_breed_unlocked(id: int)

var breeds_unlocked: Array[bool]

func check_if_unlocked(id_number: int)->void:
	if breeds_unlocked[id_number] == true:
		return
	else:
		breeds_unlocked[id_number] = true
		new_breed_unlocked.emit(id_number)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	breeds_unlocked = save_handler.breeds_unlocked
	await get_tree().process_frame
	for i in breeds_unlocked.size():
		if breeds_unlocked[i]:
			new_breed_unlocked.emit(i)
