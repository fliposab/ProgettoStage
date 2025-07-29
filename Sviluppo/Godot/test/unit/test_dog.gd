extends GutTest

var Level = preload("res://test/test_level.tscn")

var _level : Level
var _dog : TrainingImage
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_dog = _level.get_node("GoldenRetriever")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

func test_reset_position():
	_dog.return_to_spawn()
	assert_eq(_dog.global_position.x, _dog.get_spawn_position().x)
	assert_eq(_dog.global_position.z, _dog.get_spawn_position().z)
