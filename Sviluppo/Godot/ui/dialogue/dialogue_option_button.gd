extends SimpleButton
class_name DialogueOptionsButton

var index : int = 0
signal option_pressed(index: int)

func _ready()->void:
	add_sounds()
	pressed.connect(on_pressed)

func on_pressed()->void:
	option_pressed.emit(index)
