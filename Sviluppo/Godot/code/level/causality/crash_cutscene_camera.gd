extends Camera3D
class_name CrashCutsceneCamera

signal start_following(value: bool)
signal sparks_particles()
signal open_doors()

func npc_start_following()->void:
	start_following.emit(true)
	open_doors.emit()

func play_anim():
	$AnimationPlayer.play("start")

func emit_sparks_particles()->void:
	sparks_particles.emit()
