extends CharacterBody3D
class_name FollowNPC

@export_range(150,300) var speed : float = 200

@onready var _anim_player: AnimationPlayer = $Model/AnimationPlayer
@onready var footstep_sounds : FootStepsSound = $FootstepSounds

var _is_following : bool = false
var _stopped : bool = false
var direction : Vector3

signal stopped_following(follow_npc: FollowNPC)

func _ready()->void:
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _physics_process(delta: float) -> void:
	if _stopped:
		velocity = Vector3.ZERO
	else:
		follow_target(delta)
		stop_following(delta)
	fix_rotation()
	velocity += get_gravity()
	move_and_slide()

func fix_rotation()->void:
	rotation.x = 0.0
	rotation.z = 0.0

func start_following()->void:
	if _is_following:
		return
	await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
	_is_following = true
	footstep_sounds.start()

func follow_target(delta)->void:
	if !_is_following:
		return
	look_at(get_parent().global_position)
	direction = global_basis.x.rotated(Vector3(0,1,0),PI/2)
	velocity = Vector3(speed*delta*direction.x,0.0,speed*delta*direction.z)

func on_stop_following() -> void:
	_is_following = false
	var rand_rotation_y = randf_range(-PI/6,PI/6)
	direction = global_basis.x.rotated(Vector3(0,1,0),(rand_rotation_y+PI/2))
	global_rotation.y += rand_rotation_y

func stop_following(delta)->void:
	if _is_following:
		return
	velocity = Vector3(speed*delta*direction.x,0.0,speed*delta*direction.z)

func stop()->void:
	footstep_sounds.stop()
	velocity = Vector3.ZERO
	_anim_player.play("idle")
	stopped_following.emit(self)
	look_at(owner.owner.ice_cream_shop.global_position)
	_stopped = true

func start_timer()->void:
	var wait : float = randf_range(1.5, 2.0)
	await get_tree().create_timer(wait).timeout 
	stop()

func save_position()->void:
	stopped_following.emit(self)

func is_following()->bool:
	return _is_following
