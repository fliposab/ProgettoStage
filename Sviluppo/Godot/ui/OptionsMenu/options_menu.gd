extends Control
class_name OptionsMenu

@export var option_button : OpenOptionsButton

@onready var saves_handler : SavesHandler = $OptionSavesHandler
@onready var buttons_container : OptionsButtons = $VBoxContainer/ButtonsContainer
@onready var save_button : Button = $Save

func _ready():
	hide()
	check_settings()
	
func _input(event: InputEvent) -> void:
	if event.is_action("ui_cancel") and visible:
		save_button.grab_focus()

func hide_menu():
	hide()
	option_button.get_parent().get_child(0).grab_focus()

func save_settings():
	saves_handler.save_data()
	hide_menu()
	await get_tree().process_frame
	owner.exit_options.emit()
	
func check_settings():
	for i in buttons_container.get_child_count():
		if buttons_container.get_child(i) is OptionsButton:
			buttons_container.get_child(i).check_selected_item(saves_handler)
