extends Node

var td_to_give : int = 0
var value : int = 0
var td_given : int = 0

func _on_dog_breed_sign_hide_grid() -> void:
	for i in td_to_give:
		$CollectibleSpawner.generate_collectible()
	td_given += td_to_give
	td_to_give = 0

func _on_decision_tree_new_breed_unlocked(_id: int) -> void:
	value += 1
	td_to_give = max(0, value - td_given)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	for i in save_handler.breeds_unlocked.size():
		if save_handler.breeds_unlocked[i]:
			td_given += 1
