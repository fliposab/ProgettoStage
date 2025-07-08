extends Node
class_name CutsceneHandler

@onready var crash_cutscene : CrashCutscene = $CrashCutscene

func _on_ac_units_all_units_on(player: Player) -> void:
	crash_cutscene.start(player)
