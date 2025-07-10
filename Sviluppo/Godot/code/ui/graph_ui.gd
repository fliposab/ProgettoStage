extends Control
class_name GraphUI

@onready var line_chart : LineChart = $VBoxContainer/PanelContainer/LineChart

func _on_draw() -> void:
	line_chart.draw_line_chart()

func _on_hidden() -> void:
	line_chart.delete_line_chart()
