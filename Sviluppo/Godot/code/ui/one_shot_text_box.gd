extends DialogueBoxSimple
class_name OneShotBoxSimple

func hide_text_box()->void:
	hide()
	queue_free()
