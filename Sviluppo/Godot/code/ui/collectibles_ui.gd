extends PanelContainer

@onready var text : RichTextLabel = $RichTextLabel
var max_value : int 

func change_text_count(value: int)->void:
	await get_tree().physics_frame
	text.set_text("[b]%s / %s" % [value, max_value])

func _on_collectibles_max_changed(value: Variant) -> void:
	max_value = value
