extends GutTest

var Level = preload("res://test/test_level_2.tscn")

var _level : Level
var _player: Player
var _dec_node : DecisionNodeIntermediate
var _dec_node_right : DecisionNodeFinal
var _dec_node_wrong : DecisionNodeFinal
var _ti : TrainingImage
var _ti2 : TrainingImage
var _dog_ui : DogBreedButton
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_dec_node = _level.get_node("DecisionNode")
	_dec_node_right = _level.get_node("DecisionTree/Nodes/DecisionNodeFinal15")
	_dec_node_wrong = _level.get_node("DecisionNodeFinal2")
	_ti = _level.get_node("TI")
	_ti2 = _level.get_node("TI2")
	_dog_ui = _level.get_node("DogBreedSign/SignUI/VBoxContainer/PanelContainer/ScrollContainer/MarginContainer/GridContainer/DogBreedButton")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_node_ui():
	assert_true(_dec_node.get_ui().visible)

func test_node_right():
	assert_true(_ti.id == _dec_node_right.id)
	assert_true(_dec_node_right.get_is_correct())

func test_node_wrong():
	assert_false(_ti2.id == _dec_node_wrong.id)
	assert_false(_dec_node_wrong.get_is_correct())

func test_sign_update():
	assert_true(_dog_ui.unlocked)
