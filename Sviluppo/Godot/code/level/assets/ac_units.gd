extends Node3D
class_name ACUnits

var already_on : bool = false
var units : Array[bool] = []

signal all_units_on()
signal start_cutscene(player: Player, play: bool)

func _ready()->void:
	await get_tree().process_frame
	if already_on:
		return
	for i in get_child_count():
		units.append(owner.saves_handler.ac_on_all)
		get_child(i).index = i
		get_child(i).on = units[i]
		get_child(i).turned_on.connect(activate_unit)

func activate_unit(index: int, player: Player)->void:
	units[index] = true
	if check_if_activated_all():
		start_cutscene.emit(player, true)

func check_if_activated_all()->bool:
	for i in units.size():
		if units[i] == false:
			return false
	return true

func check_if_already_activated(save_handler: SavesHandler)->void:
	if save_handler.ac_on_all:
		already_on = true
		all_units_on.emit()
	
