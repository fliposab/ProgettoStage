extends GutTest

var LinearRegressionGraphHorizontal = preload("res://levels/assets/lr_graph.tscn")

var _graph : LinearRegressionGraph
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_graph = LinearRegressionGraphHorizontal.instantiate()
	add_child(_graph)

func after_all():
	var coverage: Coverage = Coverage.instance
	coverage.save_coverage_file("test_dog.json")
	_graph.queue_free()

func before_each():
	await get_tree().process_frame
	
func after_each():
	_sender.release_all()
	_sender.clear()

func test_start_position():
	assert_eq(_graph.global_rotation.x, 0.0)
	assert_eq(_graph.line.global_rotation.x , 0.0)

func test_add_new_point():
	var prev_rotation = _graph.line.global_rotation
	_graph.add_point(_graph.global_position)
	await wait_process_frames(5)
	assert_false(prev_rotation == _graph.line.global_rotation)
