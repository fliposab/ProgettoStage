extends Control

func _ready()->void:
	hide()
func _on_graph_sign_focus_grid() -> void:
	show()

func _on_graph_sign_hide_grid() -> void:
	hide()
