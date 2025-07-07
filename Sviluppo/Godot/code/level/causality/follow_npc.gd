extends CharacterBody3D
class_name FollowNPC

func _ready()->void:
	await get_tree().process_frame
	global_position = get_parent().global_position

func _physics_process(delta: float) -> void:
	look_at(get_parent().global_position)
	fix_rotation()
	move_and_slide()

func fix_rotation()->void:
	rotation.x = 0.0
	rotation.z = 0.0
