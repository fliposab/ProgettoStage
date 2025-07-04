extends NPC
class_name NPCDIalogue

@onready var _dialogue : Dialogue = $Dialogue
@onready var _area : Area3D = $Area3D
#var player : Player

func _on_dialogue_dialogue_ended() -> void:
	player.change_state("Idle")
	_area.monitoring = true
	_model.stop_talking()

func _on_interact_button_pressed()->void:
	_dialogue.start_dialogue()
	_ui.hide()
	player.face(self)
	player.change_state("Interact")
	_area.monitoring = false
	_model.start_talking(player)

func model_area_entered():
	_model.start_waving(player)

func model_area_exited():
	_model.stop_waving()
