extends VBoxContainer
class_name DialogueOptionsButtons

@export_range(1,3) var right_option: int = 1

func _ready()->void:
	connect_signals()

func connect_signals()->void:
	get_child(0).pressed.connect(_on_button_1_pressed)
	get_child(1).pressed.connect(_on_button_2_pressed)
	get_child(2).pressed.connect(_on_button_3_pressed)

func _on_button_1_pressed()->void:
	check_if_correct(1)

func _on_button_2_pressed()->void:
	check_if_correct(2)

func _on_button_3_pressed()->void:
	check_if_correct(3)

func check_if_correct(index: int)->void:
	if right_option == index:
		owner.on_correct_option_pressed()
	else:
		owner.on_wrong_option_pressed()
