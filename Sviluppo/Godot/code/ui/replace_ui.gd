extends Node
class_name ReplaceUI

@onready var new_grid : Control = $SignUI

func replace_ui()->void:
	get_parent().grid.free()
	get_parent().add_child(new_grid)
	get_parent().grid = new_grid
	get_parent().grid.name = "SignUI"
