extends Node3D
class_name LinearRegressionGraph

@onready var points : Node3D = $Points
@onready var line : CSGBox3D = $CSGCombiner3D/Line
@export var new_point_scene_path : String = "res://levels/assets/graph_point.tscn"

func _physics_process(delta: float) -> void:
	line.global_rotation = Vector3.ZERO
	calculate_a_b()
	global_rotation.x = 0.0
	line.global_rotation.x = 0.0

func add_point(new_point_position: Vector3)->void:
	var new_point : GraphPoint = preload("res://levels/assets/graph_point.tscn").instantiate()
	points.add_child(new_point)
	new_point.custom = true
	new_point.global_position = new_point_position
	calculate_a_b()
	global_rotation.x = 0.0
	line.global_rotation.x = 0.0

func reset_points()->void:
	line.global_rotation = Vector3.ZERO
	for i in points.get_child_count():
		if points.get_child(i).custom:
			points.get_child(i).queue_free()
	calculate_a_b()
	global_rotation.x = 0.0
	line.global_rotation.x = 0.0
	
func calculate_a_b()->void:
	var sum_x : float = 0.0
	var sum_x2 : float = 0.0
	var sum_y : float = 0.0
	var sum_y2 : float = 0.0
	var sum_xy : float = 0.0
	var num : float = 0.0
	
	for i in points.get_child_count():
		num += 1
		sum_x += points.get_child(i).global_position.x
		sum_y += points.get_child(i).global_position.z
		sum_x2 += (points.get_child(i).global_position.x)**2
		sum_y2 += (points.get_child(i).global_position.z)**2
		sum_xy += (points.get_child(i).global_position.z)*(points.get_child(i).global_position.x)
	var a = (sum_y*sum_x2 - sum_x*sum_xy)/(num*(sum_x2) - (sum_x)**2)
	var b = (num*(sum_xy)-sum_x*sum_y)/(num*(sum_x2)-(sum_x)**2)
	var center : Vector3 = Vector3(sum_x/num, global_position.y, sum_y/num)
	calculate_pos_rot(a, b, center)

func calculate_pos_rot(a: float, b: float, center: Vector3)->void:
	var y1 = a + b * (center.x + 1.0)
	var y2 = a + b * (center.x - 1.0)
	var point1 : Vector3 = Vector3(center.x + 1.0, global_position.y, y1)
	var point2 : Vector3 = Vector3(center.x - 1.0, global_position.y, y2)
	$debugsphere1.global_position = point1
	$debugsphere2.global_position = point2

	position_line(point1, point2)

func position_line(point1: Vector3, point2: Vector3)->void:
	var sum : Vector3 = Vector3(point1.x+point2.x, point1.y+point2.y, point1.z+point2.z)
	var new_position : Vector3 = Vector3(sum.x/2.0,global_position.y-0.2,sum.z/2.0)
	line.look_at(point1)
	line.global_position = new_position
