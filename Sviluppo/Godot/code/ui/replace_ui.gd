extends Node
class_name ReplaceUI

@onready var new_grid : Control = $NewSignUI
signal change_model()

var ui_changed : bool = false

func replace_ui()->void: 
	await get_tree().process_frame
	get_parent().grid.free()
	get_parent().add_child(new_grid)
	get_parent().grid = new_grid
	new_grid.name = "SignUI"
	new_grid.owner = get_parent()
	change_model.emit()
	ui_changed = true
