extends Node
class_name Dialogue

var index : int = 0
var index_max : int = 0

signal dialogue_ended

func _ready()->void:
	hide_all()
	process_mode = Node.PROCESS_MODE_DISABLED
	
func start_dialogue()->void:
	process_mode = Node.PROCESS_MODE_INHERIT
	index = 0
	get_child(index).show()

func hide_all()->void:
	index_max = 0
	index = 0
	for i in get_child_count():
		get_child(i).hide()
		index_max += 1
	process_mode = Node.PROCESS_MODE_DISABLED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		next_text()

func next_text()->void:
	index += 1
	if index >= index_max:
		end_dialogue()
	else:
		get_child(index).show()

func end_dialogue():
	dialogue_ended.emit()
	hide_all()
