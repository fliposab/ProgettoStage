extends PanelContainer

@onready var text : RichTextLabel = $RichTextLabel

func change_text_count(value: int)->void:
	text.set_text("[b]%s"%value)
