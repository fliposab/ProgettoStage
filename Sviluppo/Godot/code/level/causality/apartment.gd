extends Node3D
class_name Apartment

@onready var animation_player : AnimationPlayer = $apartment/AnimationPlayer

func play_open()->void:
	animation_player.play("close-open")

func already_open()->void:
	animation_player.play("open")
