extends GutTest

var Level = preload("res://test/test_level_dog.tscn")

var _level : Level
var _player: Player
var _training_image : TrainingImage
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_training_image = _level.get_node("TI")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_pick_up_prompt_ui():
	var grab_item_node_ui = _player.grab_item.get_node("Control")
	assert_true(grab_item_node_ui.get_node("Grab").visible)

func test_pick_up_state():
	_sender.action_down("interact").hold_for(0.05)
	await _sender.idle
	assert_eq(_player.get_current_state_name(), "Grab")

func test_holding_object():
	await wait_process_frames(10)
	assert_eq(_player.grab_item.hold_item, _training_image)

func test_move_with_item():
	_sender.action_down("move_forward").hold_for(0.1)
	await wait_process_frames(1)
	assert_false(_player.velocity == Vector3.ZERO)
	assert_eq(_player.grab_item.hold_item, _training_image)
	assert_true(_player.grab_item.is_holding)
	await _sender.idle

func test_jump_with_item():
	_sender.action_down("jump").hold_for(0.1)
	await _sender.idle
	assert_false(_player.is_on_floor())
	assert_eq(_player.grab_item.hold_item, _training_image)
	assert_true(_player.grab_item.is_holding)
	await wait_seconds(1.8)

func test_drop_prompt_ui():
	var grab_item_node_ui = _player.grab_item.get_node("Control")
	assert_true(grab_item_node_ui.get_node("Drop").visible)

func test_drop_down_state():
	_sender.action_down("interact").hold_for(0.05)
	await _sender.idle
	assert_eq(_player.get_current_state_name(), "Release")

func test_training_image_new_position():
	assert_almost_eq(_player.global_position, _training_image.global_position, Vector3(5.0,5.0,5.0))
