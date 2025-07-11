extends Button

func _on_pressed() -> void:
	delete_saves()
	LevelsTransition.new_game()

func delete_saves()->void:
	DirAccess.remove_absolute("user://player_save.ini") 
	DirAccess.remove_absolute("user://dt_level_save.ini")
	DirAccess.remove_absolute("user://causality_save.ini")
