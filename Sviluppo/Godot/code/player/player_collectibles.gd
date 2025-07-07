extends Node
class_name PlayerCollectibles

@export var count_red : int = 0
@export var count_blue : int = 0
@export var count_green : int = 0

signal changed_red(count: int)
signal changed_blue(count: int)
signal changed_green(count: int)

func _ready()->void:
	await get_tree().process_frame
	changed_red.emit(count_red)
	changed_green.emit(count_green)
	changed_blue.emit(count_blue)
	
func add(value: int, groups: Array[StringName])->void:
	match groups[0]:
		"collectibles_red":
			count_red += value
			changed_red.emit(count_red)
		"collectibles_green":
			count_green += value
			changed_green.emit(count_green)
		"collectibles_blue":
			count_blue += value
			changed_blue.emit(count_blue)
