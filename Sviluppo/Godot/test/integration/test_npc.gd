extends GutTest

var Level = preload("res://test/test_level.tscn")

var _level : Level
var _player: Player
var _npc: NPC
var _npc_dialogue: NPCDIalogue
var _sender : GutInputSender = GutInputSender.new(Input)

##Instead of loading the level at every test, we just instantiate it before all tests
func before_all():
	_level = Level.instantiate()
	add_child(_level)
	_npc = _level.get_node("NPC")
	_npc_dialogue = _level.get_node("NPCDialogue")
	await wait_process_frames(10)
	_player = _level.get_node("Player")

func after_all():
	_level.queue_free()

func before_each():
	await get_tree().process_frame

func after_each():
	_sender.release_all()
	_sender.clear()

func test_show_ui():
	_sender.action_down("move_right").hold_for(0.2)
	await _sender.idle
	await wait_process_frames(10)
	assert_false(_player.get_camera().project_ui_node.get_items().size() == 0)

func test_ui_project():
	assert_true(_npc.ui == _player.get_camera().project_ui_node.get_items()[0]\
	or _npc_dialogue.ui == _player.get_camera().project_ui_node.get_items()[0])

func test_npc_interact_animation():
	assert_eq(_npc.get_model().get_current_animation_name(), "talk")

func test_npc_dialogue_interact_animation():
	assert_eq(_npc_dialogue.get_model().get_current_animation_name(), "wave")

func test_interact_state():
	_sender.action_down("interact").hold_for(0.1)
	await _sender.idle
	assert_eq(_player.get_current_state_name(), "Interact")

func test_dialogue():
	assert_true(_npc_dialogue.get_dialogue().get_child(0).visible)

#Mess 1

func test_dialogue_follow():
	_sender.action_down("interact").hold_for(0.3)
	await _sender.idle
	assert_false(_npc_dialogue.get_dialogue().get_child(0).visible)
	assert_true(_npc_dialogue.get_dialogue().get_child(1).visible)

# Mess 2

func test_dialogue_follow_2():
	_sender.action_down("interact").hold_for(0.3)
	await _sender.idle
	assert_false(_npc_dialogue.get_dialogue().get_child(1).visible)
	assert_true(_npc_dialogue.get_dialogue().get_child(2).visible)

func test_dialogue_option_select():
	await wait_seconds(0.1)
	_sender.action_down("ui_accept").hold_for(0.2)
	await _sender.idle
	await wait_process_frames(5)
	assert_false(_npc_dialogue.get_dialogue().get_child(2).visible)

func test_interaction_end():
	_sender.action_down("interact").hold_for(1.0)
	await _sender.idle
	assert_eq(_player.get_current_state_name(), "Idle")

func test_dialogue_end():
	await wait_process_frames(10)
	if !(_npc_dialogue.get_dialogue().get_child(3)):
		assert_true(true)
	else:
		assert_true(false)
