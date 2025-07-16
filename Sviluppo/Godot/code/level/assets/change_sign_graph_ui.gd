extends Node
class_name ChangeGraphSignUI

@export var units_on : int = 0

signal change_data(new_data: int)

func increase_number(_array)->void:
	units_on += 1
	change_data.emit(units_on)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	if save_handler.data.has("ac_on"):
		check_units_on(save_handler.data["ac_on"])
	change_data.emit(units_on)

func check_units_on(array: Array[bool])->void:
	for i in array.size():
		if array[i]:
			units_on += 1
