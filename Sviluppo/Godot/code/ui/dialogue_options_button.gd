extends VBoxContainer
class_name DialogueOptionsButtons

##The position of the correct option
@export_range(1,10) var right_option: int = 1

signal correct_option_selected
signal wrong_option_selected

func _ready()->void:
	connect_signals()

##connects all the child buttons pressed signal and numerates 
##the index of the buttons
func connect_signals()->void:
	for i in get_child_count():
		get_child(i).option_pressed.connect(on_option_pressed)
		get_child(i).index = i

##Received when a button is pressed
func on_option_pressed(index: int)->void:
	check_if_correct(index+1)

##Checks if the answer is correct or not
func check_if_correct(index: int)->void:
	if right_option == index:
		owner.on_correct_option_pressed()
		correct_option_selected.emit()
	else:
		owner.on_wrong_option_pressed()
		wrong_option_selected.emit()
