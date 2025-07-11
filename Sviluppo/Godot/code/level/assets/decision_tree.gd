extends Node3D
class_name DecisionTree

signal send_data(id: int)
signal new_breed_unlocked()

func send_correct_data(id_number: int):
	send_data.emit(id_number)
	check_if_unlocked(id_number)

func check_if_unlocked(id_number: int)->void:
	if owner.saves_handler.breeds_unlocked[id_number] == true:
		return
	else:
		owner.saves_handler.breeds_unlocked[id_number] = true
		owner.saves_handler.save_data()
		new_breed_unlocked.emit()
