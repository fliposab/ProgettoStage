extends Node3D
class_name DogLine

func _ready() -> void:
	for i in get_child_count():
		get_child(i).id_number = i
