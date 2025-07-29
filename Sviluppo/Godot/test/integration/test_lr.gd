extends GutTest

var Level = preload("res://test/test_level_lr.tscn")

var _level : Level
var _player: Player
var _lr_cannon : LRCannon
var _graph : LinearRegressionGraph
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_lr_cannon = _level.get_node("LRCannon")
	_graph = _level.get_node("LRGraphVertical")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_button_prompt():
	assert_true(_lr_cannon.ui.visible)

func test_interact_cannon():
	_sender.action_down("interact").hold_for(0.1)
	await _sender.idle
	assert_false(_player.get_camera().current)
	assert_true(_lr_cannon.camera.current)
	assert_eq(_player.get_current_state_name(), "Interact")

func test_shoot():
	var points_count = _graph.get_points_count()
	_sender.action_down("interact").hold_for(0.2)
	await _sender.idle
	assert_true(_graph.get_points_count() == points_count+1)

func test_reset():
	var points_count = _graph.get_points_count()
	_sender.action_down("interact_reset").hold_for(0.2)
	await _sender.idle
	assert_true( _graph.get_points_count() < points_count)
