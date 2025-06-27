extends Node3D
class_name DecisionNode

@export var id : String 
@export var question_text : String
@export var is_final : bool = false


@onready var ui : Control = $Control
@onready var mesh_instance : MeshInstance3D = $StaticBody3D/MeshInstance3D

var green_material = preload("res://models/materials/green.tres")
var red_material = preload("res://models/materials/red.tres")
var gray_material = preload("res://models/materials/gray.tres")

func _ready()->void:
	$Control/Label.text = question_text
	if is_final:
		mesh_instance.set_surface_override_material(0, gray_material)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is TrainingImage:
		check_if_correct(body)
	else:
		ui.show()

func check_if_correct(body: Node3D):
	if is_final and body.id == id:
		mesh_instance.set_surface_override_material(0, green_material)
		body.toggle_grab(false)
		return
	elif is_final:
		mesh_instance.set_surface_override_material(0, red_material)
		body.toggle_grab(false)
		await get_tree().create_timer(1.0).timeout
		body.return_to_spawn()
		mesh_instance.set_surface_override_material(0, gray_material)
		return

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		ui.hide()
