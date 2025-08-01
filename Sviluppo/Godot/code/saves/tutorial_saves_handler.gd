extends SavesHandler
class_name TutorialSavesHandler

var data : Dictionary = {}

func set_save_node()->void:
	_save_node = get_child(0)

func _on_level_tube_transition_started() -> void:
	data["completed"] = true
	save_data()
