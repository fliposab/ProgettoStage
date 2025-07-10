extends NPC
class_name NPCDIalogue

@onready var _dialogue : Dialogue = $Dialogue
@onready var _area : Area3D = $Area3D
@export var turn_on_talking : bool = true

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
	if turn_on_talking:
		_model.start_talking(player)

func model_area_entered():
	if talk_on_enter:
		_model.start_waving(player)

func model_area_exited():
	_model.stop_waving()

func reposition_camera(dialogue_started: bool)->void:
	if dialogue_started:
		player.reposition_camera(self)
	else:
		player.reposition_camera()

func get_dialogue()->Dialogue:
	return _dialogue

func set_dialogue(value: Dialogue)->void:
	_dialogue = value
