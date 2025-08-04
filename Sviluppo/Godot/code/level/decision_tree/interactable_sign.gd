extends InteractableArea
class_name InteractableSign

##Class for an Interactable Sign that needs to show a wide variety of UI.

##The UI of the sign
@onready var grid : Control = $SignUI
##true when the sign UI is visible
var is_grid_open: bool = false

signal focus_grid()
signal hide_grid()
signal unlock_dog(id: int)

func _ready()->void:
	ui.hide()
	grid.hide()

##Opens the sign UI and puts the player in the Interact state
func _on_interact_button_pressed():
	player.face(self)
	player.change_state("Interact")
	is_grid_open = !is_grid_open
	if LevelsTransition.current_level:
		LevelsTransition.current_level.pause_menu.can_pause = !is_grid_open
	get_tree().paused = is_grid_open
	player.change_state("Interact")
	focus_grid.emit()
	grid.show()
	ui.hide()

##Checks the already unlocked breeds
func check_save_unlocked()->void:
	for i in owner.saves_handler.breeds_unlocked.size():
		if owner.saves_handler.breeds_unlocked[i]:
			unlock_dog.emit(i)

func _on_go_back_button_pressed():
	is_grid_open = !is_grid_open
	if LevelsTransition.current_level:
		LevelsTransition.current_level.pause_menu.can_pause = !is_grid_open
	get_tree().paused = is_grid_open
	player.change_state("Idle")
	grid.hide()
	hide_grid.emit()
	ui.show()

##Emits a signal containg the index received
##id: the index for the array
func _on_decision_tree_new_breed_unlocked(id: int) -> void:
	unlock_dog.emit(id)
