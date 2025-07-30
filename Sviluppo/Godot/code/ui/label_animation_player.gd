extends AnimationPlayer
class_name LabelAnimationPlayer

func _ready()->void:
	get_parent().hidden.connect(play_hide)
	get_parent().draw.connect(play_show)

func play_show()->void:
	play("show")

func play_hide()->void:
	play_backwards("show")
