extends GPUParticles3D
class_name OneShotParticle

func _ready()->void:
	$Timer.wait_time = lifetime + 0.1
	top_level = true
	finished.connect(_on_finished)
	one_shot = true

func _on_finished()->void:
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
