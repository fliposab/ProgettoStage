extends Node
class_name ParticleEmitter

func start_run_particles(value: bool = true):
	if value:
		load_run_particles()
		$RunDustTimer.start()
	else:
		$RunDustTimer.stop()

func load_run_particles():
	var particle : OneShotParticle  = preload("res://particles/dust_run.tscn").instantiate()
	add_child(particle)
	particle.global_position = owner.global_position
	particle.global_rotation = owner.global_rotation

func load_jump_particles():
	var particle : OneShotParticle  = preload("res://particles/dust_jump.tscn").instantiate()
	var particle_up : OneShotParticle  = preload("res://particles/dust_jump_up.tscn").instantiate()
	add_child(particle)
	add_child(particle_up)
	particle.global_position = owner.global_position
	particle.global_rotation = owner.global_rotation
	particle_up.global_position = owner.global_position
	particle_up.global_rotation = owner.global_rotation
