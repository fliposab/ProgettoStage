extends Node
class_name ChangeSignUI

@onready var new_grid : Control = $NewSignUI

var ui_changed : bool = false

func replace_ui()->void: 
	await get_tree().process_frame
	get_parent().grid.free()
	get_parent().add_child(new_grid)
	get_parent().grid = new_grid
	new_grid.name = "SignUI"
	new_grid.owner = get_parent()
	change_model()
	ui_changed = true

func change_model()->void:
	get_parent().get_node("sign/sign_001").show()
