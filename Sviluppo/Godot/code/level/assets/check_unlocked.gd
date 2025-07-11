extends Node

var td_to_give : int = 0

func _on_dog_breed_sign_hide_grid() -> void:
	for i in td_to_give:
		get_parent().give_reward()
	td_to_give = 0

func _on_decision_tree_new_breed_unlocked() -> void:
	td_to_give += 1
