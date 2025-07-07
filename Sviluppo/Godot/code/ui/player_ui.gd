extends Control
class_name PlayerUI

@onready var red_counter : PanelContainer = $HBoxContainer/RedCollectiblesContainer
@onready var green_counter : PanelContainer = $HBoxContainer/GreenCollectiblesContainer
@onready var blue_counter : PanelContainer = $HBoxContainer/BlueCollectiblesContainer

func show_collectibles_count(red: bool,green: bool,blue: bool):
	red_counter.visible = red
	green_counter.visible = green
	blue_counter.visible = blue

func _on_collectibles_changed_blue(count: int) -> void:
	blue_counter.change_text_count(count)

func _on_collectibles_changed_green(count: int) -> void:
	green_counter.change_text_count(count)
	
func _on_collectibles_changed_red(count: int) -> void:
	red_counter.change_text_count(count)
