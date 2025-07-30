extends GutTest

var Level = preload("res://test/test_level_collect.tscn")
var Player := preload("res://code/player.gd")

var _level : Level
var _player : Player
var _sender : GutInputSender = GutInputSender.new(Input)

func before_each():
	_level = add_child_autofree(Level.instantiate())
	await get_tree().process_frame
	await get_tree().process_frame
	_player = _level.get_node("Player")
	add_child(_player)
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

#up blue
func test_blue():
	_sender.action_down("move_forward").hold_for(0.4)
	await _sender.idle
	assert_eq(_player.get_collectibles_node().count_blue, 1)

#right green
func test_green():
	_sender.action_down("move_right").hold_for(0.4)
	await _sender.idle
	assert_eq(_player.get_collectibles_node().count_green, 1)

#down red
func test_red():
	_sender.action_down("move_back").hold_for(0.6)
	await _sender.idle
	assert_eq(_player.get_collectibles_node().count_red, 1)
