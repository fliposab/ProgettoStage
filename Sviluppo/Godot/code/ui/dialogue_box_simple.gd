extends Control
class_name DialogueBoxSimple

var dialogue_handler : Dialogue
var one_shot: bool = false

signal next_message()

func _ready()->void:
	pass

func show_text_box()->void:
	show()

func hide_text_box()->void:
	hide()
	if one_shot:
		queue_free()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and visible:
		_on_interact_button_pressed()
		

func _on_interact_button_pressed()->void:
	dialogue_handler.next_text()
	next_message.emit()

func remove_after_finished()->void:
	one_shot = true
	
