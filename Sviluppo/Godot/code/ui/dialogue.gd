extends Node
class_name Dialogue

var index : int = 0

signal dialogue_ended

func _ready()->void:
	hide_all()
	process_mode = Node.PROCESS_MODE_DISABLED
	
func start_dialogue()->void:
	process_mode = Node.PROCESS_MODE_INHERIT
	index = 0
	get_child(index).show_text_box()

func hide_all()->void:
	index = 0
	for i in get_child_count():
		get_child(i).hide_text_box()
	process_mode = Node.PROCESS_MODE_DISABLED

func next_text()->void:
	index += 1
	if !get_child(index):
		end_dialogue()
	else:
		get_child(index-1).hide_text_box()
		get_child(index).show_text_box()

func end_dialogue():
	dialogue_ended.emit()
	hide_all()

func add_text_box(text_box: DialogueBoxSimple)->void:
	add_child(text_box)
	text_box.set_owner(self)
