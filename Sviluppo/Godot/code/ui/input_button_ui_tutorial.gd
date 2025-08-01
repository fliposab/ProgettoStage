extends Control
class_name InputButtonUITutorial

@onready var keyboard_icon : Control = $PanelContainer/HBoxContainer/KeyBoard
@onready var joy_icon : TextureRect = $PanelContainer/HBoxContainer/JoyPad
@onready var label : Label = $PanelContainer/HBoxContainer/Label

@export var label_text : String = "MOVE"

func _ready():
	set_label_text()
	connect_signal()
	keyboard_icon.show()

func connect_signal():
	InputUIHandler.device_changed.connect(_on_device_changed)
	draw.connect(_on_draw)

func _on_device_changed(device: String)->void:
	match device:
		"Keyboard":
			keyboard_icon.show()
			joy_icon.hide()
		_:
			change_controller_ui()

func _on_draw():
	set_label_text()

func change_controller_ui()->void:
	joy_icon.show()
	keyboard_icon.hide()

func set_label_text():
	label.text = tr(label_text)+" "

func _on_area_3d_body_entered(_body: Node3D) -> void:
	show()

func _on_area_3d_body_exited(_body: Node3D) -> void:
	hide()
