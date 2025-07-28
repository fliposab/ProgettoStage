extends GutTest

var Level = preload("res://test/test_level.tscn")
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

func test_file_player():
	assert_file_exists("res://code/player.gd")

#idle tests
func test_player_idle():
	await get_tree().create_timer(0.5).timeout
	assert_true(_player.is_on_floor())
	assert_true(_player.velocity == Vector3.ZERO)

##
func test_player_idle_state():
	await get_tree().create_timer(0.5).timeout
	assert_eq(_player.get_current_state_name(), "Idle")

##
func test_player_idle_animation():
	await get_tree().create_timer(0.5).timeout
	assert_eq(_player.get_current_animation_name(), "idle")

##
func test_player_camera_start_rotation():
	await get_tree().create_timer(0.5).timeout
	assert_almost_eq(_player.get_camera().global_rotation.y, _player.model.global_rotation.y, 0.05)

##
func test_camera_manual_movement():
	var prev_rotation = _player.get_camera().global_rotation
	_sender.action_down("rotate_camera_right").hold_for(0.34)
	await _sender.idle
	assert_false(_player.get_camera().global_rotation == prev_rotation)

##
func test_player_ground_movement():
	_sender.action_down("move_right").hold_for(1)
	await wait_process_frames(5)
	assert_true(_player.velocity!=Vector3.ZERO)
	assert_eq(_player.get_current_state_name(), "GroundMove")
	assert_eq(_player.get_current_animation_name(), "run")
	await _sender.idle

##
func test_camera_automatic_movement():
	_sender.action_down("move_right").hold_for(0.34)
	await _sender.idle
	assert_true(abs(_player.get_camera().global_rotation.y)>0)

func test_player_jump():
	await wait_process_frames(5)
	_sender.action_down("jump").hold_for(0.04)
	await _sender.idle
	assert_eq(_player.is_on_floor(), false)
	assert_true(_player.velocity.y>0.0)
	assert_eq(_player.get_current_state_name(), "Air")
	assert_eq(_player.get_current_animation_name(), "jump")

func test_player_fall():
	await wait_process_frames(5)
	_sender.action_down("jump").hold_for(0.8)
	await _sender.idle
	assert_false(_player.is_on_floor())
	assert_true(_player.velocity.y<0)
	assert_eq(_player.get_current_state_name(), "Air")
	assert_eq(_player.get_current_animation_name(), "")
