extends SimpleButton

func _on_pressed() -> void:
	delete_saves()
	LevelsTransition.new_game()

func delete_saves()->void:
	DirAccess.remove_absolute("./player_save.ini") 
	DirAccess.remove_absolute("./decision_tree_save.ini")
	DirAccess.remove_absolute("./causality_save.ini")
