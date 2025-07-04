extends InteractableArea
class_name ACUnit

var on : bool = false

func _on_interact_button_pressed()->void:
	on = true
	$Area3D.queue_free()
	#emetti il suono
	#aggiungi info al livello
