extends Control
class_name GrabUI

func _on_grab_item_show_grab_ui(value: bool) -> void:
	$Grab.visible = value

func _on_grab_item_show_hold_ui(value: bool) -> void:
	$Drop.visible = value
