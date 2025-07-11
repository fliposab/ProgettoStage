@tool
extends CharacterBody3D
class_name TrainingData

@onready var mesh : Node3D = $Model
var physics_enabled : bool = false

func _ready()->void:
	global_rotation = Vector3.ZERO
	
func _physics_process(delta: float) -> void:
	mesh.rotate_y(2*PI*delta)
	if physics_enabled:
		velocity += get_gravity()*delta*3
		velocity.x = lerp(velocity.x, 0.0, 0.05)
		velocity.z = lerp(velocity.z, 0.0, 0.05)
		move_and_slide()

func activate_gravity()->void:
	physics_enabled = true
