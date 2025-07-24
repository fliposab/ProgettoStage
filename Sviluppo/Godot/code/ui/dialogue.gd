extends Control
class_name Dialogue

var index : int = 0
signal dialogue_ended
signal dialogue_ended_correct

func _ready()->void:
	hide_all()
	process_mode = Node.PROCESS_MODE_DISABLED
	
func start_dialogue()->void:
	reposition_camera(true)
	process_mode = Node.PROCESS_MODE_INHERIT
	index = 0
	get_child(index).show_text_box()

func hide_all()->void:
	index = 0
	for i in get_child_count():
		if get_child(i) is DialogueBoxSimple:
			get_child(i).hide()
			get_child(i).dialogue_handler = self
	process_mode = Node.PROCESS_MODE_DISABLED

func next_text()->void:
	index += 1
	if !get_child(index):
		end_dialogue()
	else:
		get_child(index-1).hide_text_box()
		get_child(index).show_text_box()

func end_dialogue():
	reposition_camera(false)
	dialogue_ended.emit()
	hide_all()

func add_text_box(text_box: DialogueBoxSimple)->void:
	add_child(text_box)
	text_box.set_owner(self)

func remove_text_box(text_box: DialogueBoxSimple)->void:
	text_box.queue_free()
	
func reposition_camera(dialogue_started: bool)->void:
	owner.reposition_camera(dialogue_started)

func correct_option_selected()->void:
	dialogue_ended_correct.emit()
