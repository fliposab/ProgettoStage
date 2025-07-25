extends Area3D
class_name CollectArea

func collect(collectible: Node3D):
	$CollectSound.play()
	if not collectible is TrainingData:
		return
	owner.add_collectibles(1, collectible.get_groups())
	collectible.collect()

func _on_area_entered(area: Area3D) -> void:
	collect(area.owner)
