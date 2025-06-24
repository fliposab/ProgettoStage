extends Area3D
class_name CollectArea

func collect(collectible: Node3D):
	if not collectible is TrainingData:
		return
	owner.add_collectibles(1)
	collectible.queue_free()

func _on_area_entered(area: Area3D) -> void:
	collect(area.owner)
