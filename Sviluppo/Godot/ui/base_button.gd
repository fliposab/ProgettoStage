extends Button
class_name SimpleButton

func _ready()->void:
	focus_exited.connect(on_focus_exited)

func on_focus_exited() -> void:
	$Sound.play()
