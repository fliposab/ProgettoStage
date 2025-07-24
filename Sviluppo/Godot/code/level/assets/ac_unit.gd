extends InteractableArea
class_name ACUnit

@export var on : bool = false
var index : int 
signal turned_on(index: int)

func _on_interact_button_pressed()->void:
	get_parent().activate_unit(index)
	turn_on()

func turn_on()->void:
	on = true
	$Area3D.queue_free()
