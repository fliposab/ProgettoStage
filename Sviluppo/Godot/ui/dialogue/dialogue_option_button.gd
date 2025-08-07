extends SimpleButton
class_name DialogueOptionsButton

var index : int = 0
signal option_pressed(index: int)

func _ready()->void:
	disabled = true
	add_sounds()

func enable_button():
	await get_tree().create_timer(0.2).timeout
	disabled = false

func disable_button():
	disabled = true

func _on_pressed() -> void:
	option_pressed.emit(index)
	disabled = true
