extends InteractableArea
class_name ACUnit

var on : bool = false
signal turned_on

func _on_interact_button_pressed()->void:
	turned_on.emit()
	on = true
	$Area3D.queue_free()
	#emetti il suono
	#aggiungi info al livello
