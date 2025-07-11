extends Marker3D
class_name CollectibleSpawner

@export var number : int = 1
@export var load_red: bool = true
@export var load_blue: bool = false
@export var load_green: bool = false

func generate_collectible()->void:
	if load_red:
		load_collectible("res://levels/training_data_red.tscn")
	elif load_blue:
		load_collectible("res://levels/training_data_blue.tscn")
	elif load_green:
		load_collectible("res://levels/training_data_green.tscn")

func load_collectible(path: String)->void:
	for i in number:
		var collectible : TrainingData = load(path).instantiate()
		add_child(collectible)
		collectible.activate_gravity()
		collectible.velocity.y += 12.0
		collectible.velocity.x = randf_range(-10.0,10.0)
		collectible.velocity.z = randf_range(-10.0,10.0)
