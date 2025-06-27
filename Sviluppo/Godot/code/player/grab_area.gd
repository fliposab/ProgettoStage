extends Area3D
class_name GrabArea

@onready var ui : Control = $Control

func _ready()->void:
	ui.hide()
	
func _on_body_entered(body: Node3D) -> void:
	ui.show()

func _on_body_exited(body: Node3D) -> void:
	ui.hide()
