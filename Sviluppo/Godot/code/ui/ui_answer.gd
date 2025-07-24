extends Control
class_name UIAnswer

@onready var _correct : Label = $Correct
@onready var _wrong : Label = $Wrong
@onready var _anim_player : AnimationPlayer = $AnimationPlayer

func _ready()->void:
	_correct.hide()
	_wrong.hide()

func show_correct(camera: Camera3D)->void:
	_anim_player.play("rise")
	_correct.show()
	camera.project_ui(self)

func show_wrong(camera: Camera3D)->void:
	_anim_player.play("rise")
	_wrong.show()
	camera.project_ui(self)
