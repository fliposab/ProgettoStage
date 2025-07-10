extends SavesHandler
class_name CausalitySavesHandler

@export var ac_on_all : bool = false
@export var question_answered : bool = false

func set_save_node()->void:
	_save_node = get_child(0)

func _on_ac_units_all_units_on(player: Player) -> void:
	ac_on_all = true
	save_data()

func _on_crash_cutscene_save_dialogue() -> void:
	question_answered = true
	save_data()
