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
	emit_signals()

func emit_signals()->void:
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

func get_save_values()->void:
	await get_tree().process_frame
	count_red = owner.saves_handler.red_training_data_count
	count_green = owner.saves_handler.green_training_data_count
	count_blue = owner.saves_handler.blue_training_data_count
	emit_signals()

func reset_count()->void:
	count_red = 0
	count_green = 0
	count_blue = 0
	emit_signals()

func _on_player_save_handler_data_loaded(save_handler: SavesHandler) -> void:
	await get_tree().process_frame
	count_red = save_handler.data["red_count"]
	count_green = save_handler.data["green_count"]
	count_blue = save_handler.data["blue_count"]
	emit_signals()
