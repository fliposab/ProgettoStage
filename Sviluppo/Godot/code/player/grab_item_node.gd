extends Node
class_name GrabItem

var grabbable_item : Node3D
var can_grab : bool = false
var hold_item : Node3D
var is_holding : bool = false

signal show_grab_ui(value: bool)
signal show_hold_ui(value: bool)

##Quando un oggetto entra nell'area per prendere
func set_grab_item(body: Node3D)->void:
	grabbable_item = body
	if body:
		can_grab = true
		if !is_holding:
			show_grab_ui.emit(true)
	else:
		can_grab = false
		show_grab_ui.emit(false)

##imposta che si sta tenendo l'oggetto che prima era considerato grabbable
func set_hold_item()->void:
	hold_item = grabbable_item

##imposta l'oggetto che si sta portando
func carry()->void:
	show_grab_ui.emit(false)
	show_hold_ui.emit(true)
	#_bone_attachment.add_child(grab_item)
	grabbable_item.move_node(owner.get_bone_attachment())
	grabbable_item.holding = true
	can_grab = true
	is_holding = true
	set_hold_item()
	grabbable_item = null

##Rilascia l'oggetto che stava tenendo
func release()->void:
	show_hold_ui.emit(false)
	show_grab_ui.emit(false)
	#_bone_attachment.remove_child(grab_item)
	hold_item.move_node(hold_item.og_parent, false)
	hold_item.holding = false
	can_grab = true
	is_holding = false

func can_grab_item()->bool:
	return can_grab and !is_holding

func can_release_item()->bool:
	return is_holding

func exit_area(_body)->void:
	show_grab_ui.emit(false)
	can_grab = false
