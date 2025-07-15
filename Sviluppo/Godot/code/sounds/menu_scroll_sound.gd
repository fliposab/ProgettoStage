extends AudioStreamPlayer

func _ready()->void:
	if get_parent() is Button:
		get_parent().focus_exited.connect(on_parent_button_focus_exited)

func on_parent_button_focus_exited():
	play()
