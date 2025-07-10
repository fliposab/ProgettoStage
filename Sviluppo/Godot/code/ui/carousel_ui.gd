extends Control
class_name CarouselUI

var current_index : int = 0

func _ready()->void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _on_visibility_changed() -> void:
	if visible:
		process_mode = Node.PROCESS_MODE_INHERIT
		show_first()
	else:
		process_mode = Node.PROCESS_MODE_DISABLED

func show_first()->void:
	get_child(current_index).show()
	for i in get_child_count():
		if i == current_index:
			continue
		get_child(i).hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		get_child(current_index).hide()
		scroll_index(-1)
		get_child(current_index).show()
	elif event.is_action_pressed("ui_right"):
		get_child(current_index).hide()
		scroll_index(1)
		get_child(current_index).show()

func scroll_index(value: int)->void:
	current_index += value
	if current_index < 0:
		current_index = get_child_count()-1
	elif current_index >= get_child_count():
		current_index = 0
