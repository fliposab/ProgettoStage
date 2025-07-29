extends GutTest

var Level = preload("res://test/test_level_2.tscn")

var _level : Level
var _player: Player
var _sign : InteractableSign
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_sign = _level.get_node("GraphSign")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_interact_sign():
	_sender.action_down("interact").hold_for(0.1)
	await _sender.idle
	await wait_process_frames(2)
	assert_true(_sign.grid.visible)

func test_quit_interact():
	_sender.action_down("interact_go_back").hold_for(0.1)
	await wait_seconds(0.15)
	assert_true(_sign.ui.visible)

t
