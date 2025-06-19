extends SavesHandler

@export var window_mode : int = 1
@export var window_resolution : Vector2i = Vector2i(1280, 720)
@export var resolution_scale : float = 1.0
@export var anti_aliasing : int = 4
@export var shadows_quality : int = 2

func set_save_node()->void:
	save_node = OptionsSaves
