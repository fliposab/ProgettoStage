extends HBoxContainer
class_name OptionsButton

@onready var label : Label = $Label
@onready var option_button : Control = $OptionButton

signal pass_value(name: String, index: int)

func _ready()->void:
	if option_button is OptionsButton:
		option_button.item_selected.connect(_on_item_selected)
		

func _on_focus_entered() -> void:
	option_button.grab_focus()

func grab_button_focus() -> void:
	option_button.grab_focus()

func _on_item_selected(index: int) -> void:
	pass

func check_selected_item(saves_handler: SavesHandler):
	return
