extends Marker3D
class_name PlayerSpawn

signal player_spawned(player: Player)

func _ready()->void:
	await owner.ready
	var player : Player = preload("res://entities/player.tscn").instantiate()	
	player_spawned.emit(player)
	player.global_rotation = global_rotation
	player.global_position = global_position
	owner.add_child(player)
	player.model.global_rotation = global_rotation
