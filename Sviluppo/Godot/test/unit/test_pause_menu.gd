extends GutTest

var Level = preload("res://test/test_level.tscn")
var PauseMenu := preload("res://code/ui/pause_menu.gd")

var _level : Level
var _pause_menu : PauseMenu
var _sender : GutInputSender = GutInputSender.new(Input)


func before_each():
	_level = add_child_autofree(Level.instantiate())
	await get_tree().process_frame
	_pause_menu = _level.get_node("PauseMenu")
	add_child(_pause_menu)
	await get_tree().process_frame
	#
	_sender.action_down("ui_cancel").hold_for(0.5)
	await _sender.idle
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

func test_load_pause()->void:
	assert_eq(_pause_menu.visible, true)
	assert_eq(get_tree().paused, true)

func test_resume_button():
	await get_tree().create_timer(0.2).timeout
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await get_tree().process_frame
	assert_eq(_pause_menu.visible, false)

func test_resume_shortcut():
	await get_tree().create_timer(0.2).timeout
	_sender.action_down("ui_cancel").hold_for(0.1)
	await _sender.idle
	await get_tree().process_frame
	assert_eq(_pause_menu.visible, false)

func test_open_options():
	await get_tree().create_timer(0.2).timeout
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await get_tree().process_frame
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await get_tree().process_frame
	assert_eq(_pause_menu.on_top, false)

func test_input():
	return
	
func test_return_to_hub():
	await get_tree().create_timer(0.2).timeout
	for i in 2:
		_sender.action_down("ui_down").hold_for(0.1)
		await _sender.idle
		await get_tree().process_frame
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await get_tree().process_frame
	assert_eq(get_tree().paused, false)
	assert_eq(LevelsTransition.changing, true)
	assert_eq(LevelsTransition.to_change, "res://levels/hub_level.tscn")

func test_return_to_main_menu():
	await get_tree().create_timer(0.2).timeout
	for i in 3:
		_sender.action_down("ui_down").hold_for(0.1)
		await _sender.idle
		await get_tree().process_frame
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await get_tree().create_timer(1).timeout
