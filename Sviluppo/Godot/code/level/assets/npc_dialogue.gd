extends NPC
class_name NPCDIalogue

@onready var _dialogue : Dialogue = $Dialogue
@onready var _area : Area3D = $Area3D
var player : Player
var is_player_inside : bool = false

func _input(event: InputEvent) -> void:
	if is_player_inside and !(player.grab_item.can_grab_item() or\
	player.grab_item.can_release_item()) and event.is_action_pressed("interact"):
		_dialogue.start_dialogue()
		_ui.hide()
		player.face(self)
		is_player_inside = true
		player.change_state("Interact")
		_area.monitoring = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	player = body
	is_player_inside = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	is_player_inside = false

func _on_dialogue_dialogue_ended() -> void:
	player.change_state("Idle")
	_area.monitoring = true
