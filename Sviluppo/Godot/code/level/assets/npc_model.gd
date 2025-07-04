extends Node3D
class_name NPCModel

var _target: Node3D

func start_talking(new_target: Node3D)->void:
	_target = new_target
	$AnimationPlayer.play("talk")
	
func stop_talking()->void:
	_target = null
	$AnimationPlayer.play("idle")

func start_waving(new_target: Node3D)->void:
	_target = new_target
	$AnimationPlayer.play("wave")

func stop_waving()->void:
	_target = null
	$AnimationPlayer.play("idle")

func _physics_process(delta: float) -> void:
	if !_target:
		return
	look_at(_target.global_position)
	global_rotation.y += PI #?
	global_rotation.x = 0.0
	global_rotation.z = 0.0
