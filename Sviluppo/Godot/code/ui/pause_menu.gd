extends Control
class_name PauseMenu

var can_pause : bool = true
var level : Level
var on_top : bool = true

@onready var pause_buttons := $VBoxContainer/PauseButtons

signal close_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_parent()
	visible = false
	can_pause = true

func _input(event):
	if event.is_action_pressed("ui_cancel") and can_pause == true and on_top:
		can_pause = true
		toggle_pause()

func toggle_pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	if visible:
		pause_buttons.get_first_button_focus()
	if not new_pause_state:
		emit_signal("close_menu")

func _on_resume_game():
	emit_signal("close_menu")
	get_tree().paused = false
	visible = false
