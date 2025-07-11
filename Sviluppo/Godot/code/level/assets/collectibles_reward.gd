extends Node
class_name RewardCollectibles

@onready var spawner : CollectibleSpawner = $CollectibleSpawner

func give_reward()->void:
	spawner.generate_collectible()
