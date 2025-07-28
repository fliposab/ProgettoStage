extends GutTest

var MainMenu := preload("res://ui/main_menu.tscn")

var _main_menu : MainMenu
var _sender : GutInputSender = GutInputSender.new(Input)

func before_all():
	var config := ConfigFile.new()
	config.save("./player_save.ini")

func before_each():
	_main_menu = add_child_autofree(MainMenu.instantiate())
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

func test_load_game():

	_sender.action_down("ui_accept").hold_for(0.05)
	await wait_frames(5)
	assert_eq(LevelsTransition.to_change, "res://levels/hub_level.tscn")

func test_new_game():
	_sender.action_down("ui_down").hold_for(0.05)
	await wait_frames(2)
	_sender.action_down("ui_accept").hold_for(0.05)
	await wait_frames(30)
	var config := ConfigFile.new()
	var err = config.load("./player_save.ini")
	# If the file didn't load, ignore it.
	if err != OK:
		assert_true(true)
	else:
		assert_false(true)
