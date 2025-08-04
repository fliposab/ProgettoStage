extends Node
class_name LRCannonInputHandler

signal exit()
signal reset_graph()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact_go_back"):
		exit.emit()
	elif event.is_action_pressed("interact_reset"):
		reset_graph.emit()
