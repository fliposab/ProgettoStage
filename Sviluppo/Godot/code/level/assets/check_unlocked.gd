extends Node

var td_to_give : int = 0

func _on_dog_breed_sign_hide_grid() -> void:
	for i in td_to_give:
		$CollectibleSpawner.generate_collectible()
	td_to_give = 0

func _on_decision_tree_new_breed_unlocked(_id: int) -> void:
	td_to_give += 1
