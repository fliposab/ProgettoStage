extends Node3D
class_name LinearRegressionGraph

@onready var points : Node3D = $Points
@onready var line : CSGBox3D = $CSGCombiner3D/Line
@export var new_point_scene_path : String = "res://levels/assets/graph_point.tscn"

func add_point(new_point_position: Vector3)->void:
	return

func reset_points()->void:
	return
	
func calculate_a_b()->void:
	return
	
func calculate_pos_rot(a: float, b: float, center: Vector3)->void:
	return

func position_line(point1: Vector3, point2: Vector3)->void:
	return

func resize_line(value: float)->void:
	return
