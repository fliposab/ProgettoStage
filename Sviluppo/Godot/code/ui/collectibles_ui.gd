extends PanelContainer

@onready var text : Label = $Label
@export var max_value : int = 15

func change_text_count(value: int)->void:
	await get_tree().physics_frame
	text.set_text("%s / %s" % [value, max_value])
