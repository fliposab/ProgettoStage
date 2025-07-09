extends Control
class_name YTick

@onready var label : Label = $HBoxContainer/Label

func _ready() -> void:
	size_flags_vertical = SIZE_EXPAND_FILL
	label.vertical_alignment = VERTICAL_ALIGNMENT_TOP

func set_text(value: String) -> void:
	await self.ready
	label.text = value
