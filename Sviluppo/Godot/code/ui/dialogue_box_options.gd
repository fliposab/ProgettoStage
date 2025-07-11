extends DialogueBoxSimple
class_name DialogueBoxOptions

@export var correct_text_box : PackedScene
@export var wrong_text_box : PackedScene

@onready var button_container : VBoxContainer = $VBoxContainer/PanelContainer/VBoxContainer

func show_text_box()->void:
	show()
	button_container.get_child(0).grab_focus()

func hide_text_box()->void:
	hide()

func _input(event: InputEvent) -> void:
	return
	
func _on_interact_button_pressed()->void:
	return

func on_correct_option_pressed()->void:
	var new_text_box = correct_text_box.instantiate()
	get_parent().add_text_box(new_text_box)
	get_parent().next_text()
	new_text_box.dialogue_handler = get_parent()
	new_text_box.next_message.connect(dialogue_handler.correct_option_selected)

func on_wrong_option_pressed()->void:
	var new_text_box = wrong_text_box.instantiate()
	get_parent().add_text_box(new_text_box)
	get_parent().next_text()
	new_text_box.dialogue_handler = get_parent()
	new_text_box.remove_after_finished()
