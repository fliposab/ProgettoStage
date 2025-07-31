extends Node
class_name InputPromptHandler

var current_joy : String = ""
signal device_changed(device: String)

func _ready()->void:
	Input.joy_connection_changed.connect(_on_joy_connection_changed)

# Called whenever a joypad has been connected or disconnected.
func _on_joy_connection_changed(device_id: int, connected: bool) -> void:
	if connected:
		print_rich("[color=green][b]+[/b] Found newly connected joypad #%d: [b]%s[/b] - %s[/color]"\
		% [device_id, Input.get_joy_name(device_id), Input.get_joy_guid(device_id)])
	else:
		print_rich("[color=red][b]-[/b] Disconnected joypad #%d.[/color]" % device_id)

	current_joy = Input.get_joy_name(0)
	device_changed.emit(current_joy)
