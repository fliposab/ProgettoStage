extends SavesHandler
class_name CausalitySavesHandler

var data : Dictionary = {}

func set_save_node()->void:
	_save_node = get_child(0)

func _on_ac_units_unit_turned_on(array: Array[bool]) -> void:
	data["ac_on"] = array
	save_data()
