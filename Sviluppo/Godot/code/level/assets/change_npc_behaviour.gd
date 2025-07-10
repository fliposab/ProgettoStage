extends Node
class_name ChangeNPCBehaviour

@onready var new_dialogue : Dialogue = $NewDialogue
@onready var new_ui : ProjectText = $NewControl

func change_text()->void:
	get_parent().get_dialogue().free()
	get_parent().add_child(new_dialogue)
	get_parent().set_dialogue(new_dialogue)
	get_parent().get_dialogue().name = "Dialogue"
	new_dialogue.owner = get_parent()

func change_behaviour()->void:
	get_parent().talk_on_enter = false
	get_parent().turn_on_talking = false

func rotate_npc()->void:
	get_parent().rotate_y(PI/1.5)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	if save_handler.question_answered:
		await get_tree().process_frame
		change_prompt_text()
		change_behaviour()
		#get_parent().disable_area()

func change_prompt_text()->void:
	get_parent().get_ui().free()
	get_parent().add_child(new_ui)
	get_parent().set_ui(new_ui)
	get_parent().get_dialogue().name = "Control"
	new_ui.owner = get_parent()
	get_parent().connect_signals()
