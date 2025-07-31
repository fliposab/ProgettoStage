extends Control
class_name InputButtonUI

@onready var icon : TextureRect = $PanelContainer/HBoxContainer/TextureRect
@onready var label : Label = $PanelContainer/HBoxContainer/Label
@export var label_text : String
@export var keyboard_input : Texture2D
@export var controller_input : Texture2D
@export var hide_on_start : bool = true

var ui_button : Texture2D:
	set(value):
		ui_button = value
		set_label_text()
		set_texture_rect_ui()

func _ready():
	set_label_text()
	ui_button = keyboard_input
	if hide_on_start:
		hide()
	connect_signal()

func connect_signal():
	InputUIHandler.device_changed.connect(_on_device_changed)
	draw.connect(_on_draw)

func _on_device_changed(device: String)->void:
	match device:
		"":
			ui_button = keyboard_input
		_:
			change_controller_ui()

func _on_draw():
	set_label_text()

func change_controller_ui()->void:
	if controller_input:
		ui_button = controller_input
	else:
		ui_button = keyboard_input

func set_label_text():
	label.text = tr(label_text)+" "

func set_texture_rect_ui()->void:
	icon.texture = ui_button
