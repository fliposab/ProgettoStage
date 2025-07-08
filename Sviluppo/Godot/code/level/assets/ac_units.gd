extends Node3D
class_name ACUnits

var units : Array[bool] = []
signal all_units_on(player: Player)

func _ready()->void:
	for i in get_child_count():
		units.append(false)
		get_child(i).index = i
		get_child(i).turned_on.connect(activate_unit)

func activate_unit(index: int, player: Player)->void:
	units[index] = true
	if check_if_activated_all():
		all_units_on.emit(player)

func check_if_activated_all()->bool:
	for i in units.size():
		if units[i] == false:
			return false
	return true
