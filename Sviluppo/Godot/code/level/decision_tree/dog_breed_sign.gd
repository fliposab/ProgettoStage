extends InteractableArea
class_name InteractableSign

@onready var grid : Control = $Grid
var is_grid_open: bool = false

signal focus_grid()
signal unlock_dog(id: int)

func _ready()->void:
	ui.hide()
	grid.hide()
	
func _on_interact_button_pressed():
	player.face(self)
	player.change_state("Interact")
	is_grid_open = !is_grid_open
	owner.pause_menu.can_pause = !is_grid_open
	get_tree().paused = is_grid_open
	player.change_state("Interact")
	focus_grid.emit()
	grid.show()
	ui.hide()

func _on_data_received(id: int):
	owner.saves_handler.breeds_unlocked[id] = true
	unlock_dog.emit(id)

func check_save_unlocked()->void:
	for i in owner.saves_handler.breeds_unlocked.size():
		if owner.saves_handler.breeds_unlocked[i]:
			unlock_dog.emit(i)

func _on_go_back_button_pressed():
	is_grid_open = !is_grid_open
	owner.pause_menu.can_pause = !is_grid_open
	get_tree().paused = is_grid_open
	player.change_state("Idle")
	grid.hide()
	ui.show()
