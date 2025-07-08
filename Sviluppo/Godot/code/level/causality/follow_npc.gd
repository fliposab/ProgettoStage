extends CharacterBody3D
class_name FollowNPC

@export_range(150,300) var speed : float = 200

var _is_following : bool = true
@onready var _anim_player: AnimationPlayer = $Model/AnimationPlayer

func _ready()->void:
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _physics_process(delta: float) -> void:
	follow_target(delta)
	fix_rotation()
	velocity += get_gravity()
	move_and_slide()

func fix_rotation()->void:
	rotation.x = 0.0
	rotation.z = 0.0

func follow_target(delta)->void:
	if !_is_following:
		return
	look_at(get_parent().global_position)
	var direction = global_basis.x.rotated(Vector3(0,1,0),PI/2)
	velocity = Vector3(speed*delta*direction.x,0.0,speed*delta*direction.z)
	if is_zero_approx(position.x) and is_zero_approx(position.z):
		stop_following()

func on_stop_following() -> void:
	stop_following()

func stop_following()->void:
	_is_following = false
	velocity = Vector3.ZERO
	_anim_player.play("idle")
