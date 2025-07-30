extends Node
class_name ChangeNPCIceCreamBehaviour

@onready var new_dialogue : Dialogue = $NewDialogue
var dialogue_changed : bool = false

func change_dialogue()->void:
	dialogue_changed = true
	get_parent().get_dialogue().free()
	get_parent().add_child(new_dialogue)
	get_parent().set_dialogue(new_dialogue)
	get_parent().get_dialogue().name = "Dialogue"
	new_dialogue.owner = get_parent()
