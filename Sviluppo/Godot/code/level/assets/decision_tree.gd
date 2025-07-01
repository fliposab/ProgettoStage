extends Node3D
class_name DecisionTree

signal send_data(id: int)

func send_correct_data(id_number: int):
	send_data.emit(id_number)
	owner.saves_handler.breeds_unlocked[id_number] = true
	owner.saves_handler.save_data()
