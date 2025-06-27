extends Control
class_name MainMenu

@onready var fade : Control = $Fade

func _ready()->void:
	LevelsTransition.current_level = self

func hide_transition()->void:
	for i in get_child_count()-1:
		get_child(i).hide()
