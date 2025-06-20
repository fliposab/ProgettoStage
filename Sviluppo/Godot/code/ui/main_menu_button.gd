extends Button

func _on_pressed() -> void:
	var root = get_tree().get_root()
	for i in root.get_child_count():
		if root.get_child(i) is Level:
			root.get_child(i).queue_free()
			get_tree().paused = false
			break
	load_main_menu()
	
func load_main_menu()->void:
	var main_menu : MainMenu = preload("res://ui/main_menu.tscn").instantiate()
	get_tree().get_root().add_child(main_menu)
