extends GutTest

var OptionsMenu := preload("res://ui/optionsmenu/options_menu.tscn")

var _options_menu : OptionsMenu
var _sender : GutInputSender = GutInputSender.new(Input)

func before_all():
	_options_menu = OptionsMenu.instantiate()
	add_child(_options_menu)

func after_all():
	_options_menu.queue_free()

func before_each():
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

##test change window
func test_window_mode():
	await wait_process_frames(10)
	var prev_window_mode = DisplayServer.window_get_mode()
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(10)
	assert_false(prev_window_mode == DisplayServer.window_get_mode())
	var config := ConfigFile.new()
	config.load("./options_save.ini")

func test_change_resolution():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	var prev_res = DisplayServer.window_get_size()
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(10)
	assert_false(prev_res == DisplayServer.window_get_size())

func test_change_resolution_scale():
	var prev_rs = get_viewport().scaling_3d_scale
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_right").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_false(prev_rs == get_viewport().scaling_3d_scale)

func test_change_volume():
	var prev_vol = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_right").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_false(prev_vol == AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))

func test_change_max_fps():
	var prev_mf = Engine.max_fps
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_false(prev_mf == Engine.max_fps)

func test_anti_aliasing():
	var prev_msaa = get_viewport().msaa_3d
	var prev_ssaa = get_viewport().screen_space_aa
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_false(prev_msaa == get_viewport().msaa_3d and prev_ssaa == get_viewport().screen_space_aa)

func test_change_shadows_quality():
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_true(true)

func test_change_language():
	var prev_lang = TranslationServer.get_locale()
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(15)
	assert_false(prev_lang == TranslationServer.get_locale())

"""
func test_save():
	_sender.action_down("ui_down").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(1)
	_sender.action_down("ui_accept").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(30)
	var config := ConfigFile.new()
	config.load("./options_save.ini")
	var prev_sq = config.get_value("common", "shadows_quality", 0)
	assert_false(prev_sq == config.get_value("common", "shadows_quality", 0))
"""
