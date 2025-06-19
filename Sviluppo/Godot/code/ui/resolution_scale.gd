extends OptionsButton

@onready var value_label : Label = $Value

func _on_option_button_value_changed(value: float) -> void:
	value_label.set_text("%.1f"%value)
