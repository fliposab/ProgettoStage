extends SavesHandler

@export var collectibles_taken : int = 0
@export var collectibles_number : int = 0

func set_save_node()->void:
	_save_node = LevelsSaves
