extends Node
class_name PlayerCollectibles

@export var count : int = 0
signal changed(count)
signal max_changed(value)

func _ready()->void:
	changed.emit(count)
	
func add(value: int)->void:
	var new_value = count+value
	count = max(0, new_value)
	count = min(999, count)
	changed.emit(count)

func change_max(value: int)->void:
	max_changed.emit(value)
