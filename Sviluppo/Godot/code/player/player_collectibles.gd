extends Node
class_name PlayerCollectibles

@export var count : int = 0
signal changed(count)

func add(value: int)->void:
	var new_value = count+value
	count = max(0, new_value)
	count = min(999, new_value)
	changed.emit(count)
