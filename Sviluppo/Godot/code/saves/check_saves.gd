extends Node
class_name CheckSaves

func _ready()->void:
	var config := ConfigFile.new()
	var err = config.load("user://player_save.ini")
	if err == OK:
		get_parent().show()
	else:
		get_parent().hide()
