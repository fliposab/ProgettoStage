extends Node
class_name CutsceneEmitParticles

@onready var smoke_particles : Node3D = $SmokeParticles
@onready var sparks_particles : Node3D = $SparksParticles

func emit_sparks()->void:
	$ElectricShock.play()
	sparks_particles.show()
	sparks_particles.emit_particles()
	await get_tree().create_timer(0.2).timeout
	emit_smoke()

func emit_smoke()->void:
	smoke_particles.show()
