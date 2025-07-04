extends Control
class_name DialogueBoxSimple

func _ready()->void:
	pass

func show_text_box()->void:
	show()

func hide_text_box()->void:
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and visible:
		_on_interact_button_pressed()

func _on_interact_button_pressed()->void:
	owner.next_text()
