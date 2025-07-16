extends Node3D
class_name ACUnits

var all_units_already_on : bool = false
var units : Array[bool] = []

##emitted when a player turns on an AC unit
##emitted ONLY with player input
signal unit_turned_on(array: Array[bool])
##emitted ONLY with player input
signal all_units_turned_on()

func _ready()->void:
	await get_tree().process_frame
	if all_units_already_on:
		return
	for i in get_child_count():
		units.append(false)
		get_child(i).index = i

func activate_unit(index: int)->void:
	units[index] = true
	unit_turned_on.emit(units)
	if check_if_activated_all():
		all_units_turned_on.emit()

func check_if_activated_all()->bool:
	for i in units.size():
		if units[i] == false:
			return false
	return true

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	if !save_handler.data.has("ac_on"):
		return
	all_units_already_on = true
	for i in save_handler.data["ac_on"].size():
		if save_handler.data["ac_on"][i] == false:
			all_units_already_on = false
			continue
		get_child(i).turn_on()
