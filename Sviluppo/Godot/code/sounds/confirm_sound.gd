extends AudioStreamPlayer

func _ready()->void:
	if get_parent() is Button:
		get_parent().pressed.connect(on_parent_button_pressed)

func on_parent_button_pressed():
	play()
