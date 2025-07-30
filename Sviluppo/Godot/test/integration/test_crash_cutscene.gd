extends GutTest

var Level = preload("res://test/test_level_causality.tscn")

var _level : Level
var _player : Player
var _cutscene : CrashCutscene
var _ac_units : ACUnits
var _scientist_npc : NPCDIalogue
var _ice_cream_npc : NPCDIalogue
var _scientist_sign : InteractableSign
var _follow_npc : FollowNPC
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_cutscene = _level.get_node("CutsceneHandler/CrashCutscene")
	_ac_units = _level.get_node("ACUnits")
	_scientist_npc = _level.get_node("CutsceneHandler/CrashCutscene/NPCScientist")
	_ice_cream_npc = _level.get_node("CutsceneHandler/CrashCutscene/ice_cream_shop/NPCDialogue")
	_scientist_sign = _level.get_node("CutsceneHandler/CrashCutscene/GraphSign")
	_follow_npc = _level.get_node("CutsceneHandler/CrashCutscene/PathNPC/PathFollow3D/FollowNPC")
	await wait_process_frames(5)
	_player = _level.get_node("Player")
	_sender.action_down("interact").hold_for(1)
	await _sender.idle

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_scientist_dialogue_change():
	var change_behaviour = _scientist_npc.get_node("ChangeNPCBehaviour")
	assert_true(change_behaviour.dialogue_changed)

func test_ice_cream_dialogue_changed():
	var change_behaviour = _ice_cream_npc.get_node("ChangeNPCBehaviour")
	assert_true(change_behaviour.dialogue_changed)

func test_graph_sign_changed():
	var change_behaviour = _scientist_sign.get_node("ReplaceUI")
	assert_true(change_behaviour.ui_changed)

func test_npc_stop_following():
	_cutscene.get_node("Camera3D").npc_start_following()
	_follow_npc.speed = 800
	_follow_npc.get_parent().progress_ratio = 1.0
	await _follow_npc.stopped_following
	assert_false(_follow_npc.is_following())
