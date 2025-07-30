extends GutTest

var Level = preload("res://test/test_level_causality.tscn")

var _level : Level
var _player: Player
var _test_ac : ACUnit
var _test_graph : InteractableSign
var _test_graph_value : int
var _cutscene : CrashCutscene
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_test_ac = _level.get_node("ACUnits/ACUnit2")
	_test_graph = _level.get_node("Entities/GraphSign")
	_cutscene = _level.get_node("CutsceneHandler/CrashCutscene")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func get_graph_value()->int:
	var graph_line = _test_graph.get_node("SignUI/Chart/VBoxContainer/PanelContainer/LineChart")
	return graph_line.last_data

func test_graph_start_value():
	_test_graph_value = get_graph_value()
	assert_eq(_test_graph_value, 1)

func test_ac_on():
	_sender.action_down("interact").hold_for(0.2)
	await _sender.idle
	assert_true(_test_ac.on)

func test_change_graph():
	assert_false(get_graph_value()==_test_graph_value)

func test_start_cutscene():
	assert_true(_cutscene.started)
