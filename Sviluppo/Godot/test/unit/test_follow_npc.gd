extends GutTest

var CrashCutscene = preload("res://levels/assets/causality/crash_cutscene.tscn")

var _cutscene : CrashCutscene
var _follow_npc : FollowNPC
var _target : PathCutscene

func before_all():
	_cutscene = CrashCutscene.instantiate()
	add_child(_cutscene)
	_follow_npc = _cutscene.get_node("PathNPC/PathFollow3D/FollowNPC")
	_target = _cutscene.get_node("PathNPC/PathFollow3D")

func after_all():
	var coverage: Coverage = Coverage.instance
	coverage.save_coverage_file("test_dog.json")
	_cutscene.queue_free()

func before_each():
	await get_tree().process_frame
	
func after_each():
	return

func test_follow_target():
	_follow_npc.start_following()
	var distance = abs(_follow_npc.global_position - _target.global_position)
	await wait_process_frames(25)
	var new_distance = abs(_follow_npc.global_position - _target.global_position)
	assert_true(new_distance < distance)
