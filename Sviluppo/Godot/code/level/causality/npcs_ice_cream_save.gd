extends Node3D
class_name NPCsIceCreamSave

func _ready()->void:
	turn_all()
	hide()
	toggle_collisions(false)

func toggle_collisions(value: bool)->void:
	for i in get_child_count():
		get_child(i).set_collision_layer_value(1, value)

func turn_all() -> void:
	for i in get_child_count():
		get_child(i).look_at(get_parent().global_position)

func _on_crash_cutscene_change_specific_values() -> void:
	show()
	toggle_collisions(true)
	turn_all()
