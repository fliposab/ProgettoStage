extends DialogueBoxSimple
class_name DialogueBoxOptions

@export var correct_text_box : PackedScene
@export var wrong_text_box : PackedScene
@export_multiline var correct_text : String = "CORRECT_OPTION"
@export_multiline var wrong_text : String = "WRONG_OPTION"

@onready var button_container : VBoxContainer = $VBoxContainer/PanelContainer/VBoxContainer

##Shows the text box
func show_text_box()->void:
	show()
	button_container.get_child(0).grab_focus()

##Hides the text box
func hide_text_box()->void:
	hide()

func _on_interact_button_pressed()->void:
	return

##Received when the player picks the right option
func on_correct_option_pressed()->void:
	var new_text_box : DialogueBoxSimple = correct_text_box.instantiate()
	add_new_text_box(new_text_box, tr(correct_text))
	new_text_box.next_message.connect(dialogue_handler.correct_option_selected)

##Received when the player picks the wrong option
func on_wrong_option_pressed()->void:
	var new_text_box : DialogueBoxSimple = wrong_text_box.instantiate()
	add_new_text_box(new_text_box, tr(wrong_text))

##Adds the new text box and sets it as one shot
func add_new_text_box(new_text_box: DialogueBoxSimple, text: String):
	get_parent().add_text_box(new_text_box)
	new_text_box.text = tr(text)
	get_parent().next_text()
	new_text_box.dialogue_handler = get_parent()
	new_text_box.remove_after_finished()
