extends Button
class_name SimpleButton

func _ready()->void:
	add_sounds()

##Adds the main sounds
func add_sounds()->void:
	add_scroll_sound()
	add_pressed_sound()

##Adds the scroll sound, played when the focus is lost
func add_scroll_sound(path: String = "res://sounds/menu_scroll_sound.tscn")->void:
	var scroll_sound : AudioStreamPlayer = load(path).instantiate()
	add_child(scroll_sound)

##Adds the confirm sound, played when pressed the button
func add_pressed_sound(path: String = "res://sounds/confirm_sound.tscn")->void:
	var pressed_sound : AudioStreamPlayer = load(path).instantiate()
	add_child(pressed_sound)
