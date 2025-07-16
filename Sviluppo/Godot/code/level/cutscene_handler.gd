extends Node
class_name CutscenesHandler

signal cutscene_started()
signal cutscene_finished()

@onready var crash_cutscene : CrashCutscene = $CrashCutscene

func _ready():
	init_cutscenes()
	
func cutscene_start()-> void:
	owner.player.change_state("Interact")
	cutscene_started.emit()

func cutscene_finish()-> void:
	owner.player.change_state("Idle")
	cutscene_finished.emit()

func _on_ac_units_all_units_turned_on() -> void:
	cutscene_start()
	crash_cutscene.start(true)

func _on_saves_handler_data_loaded(save_handler: SavesHandler) -> void:
	await get_tree().process_frame
	if save_handler.data.has("ac_on") and check_ac_on(save_handler.data["ac_on"]):
		crash_cutscene.start(false)

func check_ac_on(array: Array[bool])->bool:
	for i in array.size():
		if !array[i]:
			return false
	return true

func init_cutscenes():
	for i in get_child_count():
		get_child(i).cutscene_handler = self
