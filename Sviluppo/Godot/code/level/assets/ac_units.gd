extends Node3D
class_name ACUnits

var units : Array[bool] = []
signal all_units_on(player: Player, play_cutscene: bool)

func _ready()->void:
	await get_tree().process_frame
	if check_if_already_activated():
		all_units_on.emit(null, false) #fonte del problema
	for i in get_child_count():
		units.append(owner.saves_handler.ac_on_all)
		get_child(i).index = i
		get_child(i).on = units[i]
		get_child(i).turned_on.connect(activate_unit)

func activate_unit(index: int, player: Player)->void:
	units[index] = true
	if check_if_activated_all():
		all_units_on.emit(player, true)

func check_if_activated_all()->bool:
	for i in units.size():
		if units[i] == false:
			return false
	return true

func check_if_already_activated()->bool:
	return owner.saves_handler.ac_on_all
