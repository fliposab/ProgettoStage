extends SavesHandler

@export var window_mode : int = 1
@export var window_resolution : int = 1
@export var resolution_scale : float = 0.8
@export var anti_aliasing : int = 5
@export var shadows_quality : int = 2
@export var max_fps : int = 4

func set_save_node()->void:
	_save_node = OptionsSaves
