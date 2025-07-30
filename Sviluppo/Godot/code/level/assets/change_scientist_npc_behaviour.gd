extends Node
class_name ChangeNPCScientistBehaviour

@onready var new_dialogue : Dialogue = $NewDialogue
@onready var new_ui : ProjectText = $NewControl
var dialogue_changed: bool = false
var ui_changed : bool = false

func change_text()->void:
	get_parent().get_dialogue().free()
	get_parent().add_child(new_dialogue)
	get_parent().set_dialogue(new_dialogue)
	get_parent().get_dialogue().name = "Dialogue"
	new_dialogue.owner = get_parent()
	dialogue_changed = true

func change_behaviour(turn: bool = false, talk: bool = false)->void:
	get_parent().talk_on_enter = turn
	get_parent().turn_on_talking = talk

func rotate_npc()->void:
	get_parent().rotate_y(PI/1.5)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	return

func change_prompt_text()->void:
	get_parent().get_ui().free()
	get_parent().add_child(new_ui)
	get_parent().set_ui(new_ui)
	get_parent().get_ui().name = "Control"
	new_ui.owner = get_parent()
	get_parent().connect_signals()
	ui_changed = true

func _on_new_dialogue_dialogue_ended_correct() -> void:
	change_prompt_text()
	change_behaviour()

func change_text_and_behaviour():
	change_text()
	change_behaviour(true, true)
	rotate_npc()
