extends Marker3D
class_name PlayerSpawn

signal player_spawned(player: Player)

func _ready()->void:
	var player : Player = preload("res://entities/player.tscn").instantiate()
	add_child(player)
	player.global_position = global_position
	player.rotation = rotation
	player_spawned.emit(player)
