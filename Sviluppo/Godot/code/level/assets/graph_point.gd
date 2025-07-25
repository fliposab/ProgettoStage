extends MeshInstance3D
class_name GraphPoint

var custom : bool = false

func emit_particles()->void:
	$GPUParticles3D.emitting = true
