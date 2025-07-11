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

func change_behaviour(turn: bool = false, talk: bool = false)->void:
	get_parent().talk_on_enter = turn
	get_parent().turn_on_talking = talk

func rotate_npc()->void:
	get_parent().rotate_y(PI/1.5)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	await get_tree().process_frame
	if save_handler.ac_on_all:
		change_behaviour(true,true)
		change_text()
		rotate_npc()

func change_prompt_text()->void:
	get_parent().get_ui().free()
	get_parent().add_child(new_ui)
	get_parent().set_ui(new_ui)
	get_parent().get_ui().name = "Control"
	new_ui.owner = get_parent()
	get_parent().connect_signals()
