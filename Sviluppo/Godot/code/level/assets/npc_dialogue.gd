extends NPC
class_name NPCDIalogue

@onready var _dialogue : Dialogue = $Dialogue
@onready var _area : Area3D = $Area3D
@export var turn_on_talking : bool = true

func _on_dialogue_dialogue_ended() -> void:
	player.change_state("Idle")
	_model.stop_talking()
	area.monitoring =true

func _on_interact_button_pressed()->void:
	_dialogue.start_dialogue()
	ui.hide()
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

func disable_area()->void:
	_area.monitorable = false
	_area.monitoring = false
	turn_on_talking = false
	talk_on_enter = false

func remove_dialogue()->void:
	_dialogue.queue_free()

func check_if_can_talk()->bool:
	return is_inside and !(player.grab_item.can_grab_item() or\
	player.grab_item.can_release_item())\
	and player.get_current_state_name() != "Interact"\
	and !get_tree().paused and _dialogue
