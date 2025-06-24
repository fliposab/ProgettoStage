extends Node
class_name PlayerMovement

var player : Player

func _ready() -> void:
	player = owner
	
func get_move_input(delta: float, weight: float)->void:
	var vy = player.velocity.y
	player.velocity.y = 0
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var dir = Vector3(input.x, 0, input.y).rotated(Vector3.UP, player.get_spring_arm().global_rotation.y)
	player.velocity = lerp(player.velocity, dir * player.speed * delta, weight)
	player.velocity.y = vy
