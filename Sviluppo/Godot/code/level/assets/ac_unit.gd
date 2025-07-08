extends InteractableArea
class_name ACUnit

var on : bool = false
var index : int 
signal turned_on(index: int)

func _on_interact_button_pressed()->void:
	turned_on.emit(index, player)
	on = true
	$Area3D.queue_free()
	#emetti il suono
	#aggiungi info al livello
