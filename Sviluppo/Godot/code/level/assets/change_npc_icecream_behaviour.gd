extends Node
class_name ChangeNPCIceCreamBehaviour

@onready var new_dialogue : Dialogue = $NewDialogue

func change_dialogue()->void:
	get_parent().get_dialogue().free()
	get_parent().add_child(new_dialogue)
	get_parent().set_dialogue(new_dialogue)
	get_parent().get_dialogue().name = "Dialogue"
	new_dialogue.owner = get_parent()
