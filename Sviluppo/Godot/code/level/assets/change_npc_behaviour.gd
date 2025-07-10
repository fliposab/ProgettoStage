extends Node
class_name ChangeNPCBehaviour

@onready var new_dialogue : Dialogue = $NewDialogue

func change_text()->void:
	get_parent().get_dialogue().free()
	get_parent().add_child(new_dialogue)
	get_parent().set_dialogue(new_dialogue)
	get_parent().get_dialogue().name = "Dialogue"
	new_dialogue.owner = get_parent()

func change_behaviour()->void:
	get_parent().talk_on_enter = true
	get_parent().turn_on_talking = true

func rotate_npc()->void:
	get_parent().rotate_y(PI/1.5)

func _ready():
	await get_tree().process_frame
	change_text()
	change_behaviour()
	rotate_npc()
