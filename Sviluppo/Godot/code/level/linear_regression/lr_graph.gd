@tool
extends Node3D
class_name LinearRegressionGraph

@onready var points : Node3D = $Points
@onready var line : Node3D = $Line


func _ready() ->void:
	line.global_rotation = Vector3.ZERO
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
	#print("sum_x2: ",sum_x2)
	#print("sum_y2: ",sum_y2)
	#print("sum_xy: ",sum_xy)
	var a = (sum_y*sum_x2 - sum_x*sum_xy)/(num*(sum_x2) - (sum_x)**2)
	var b = (num*(sum_xy)-sum_x*sum_y)/(num*(sum_x2)-(sum_x)**2)
	#print("y = ",a," + ",b,"x")
	calculate_pos_rot(a,b)

func calculate_pos_rot(a: float, b: float)->void:
	var y1 = a + b * (global_position.x + 2.0)
	var y2 = a + b * (global_position.x - 2.0)
	var point1 : Vector3 = Vector3(global_position.x + 2.0, global_position.y, y1)
	var point2 : Vector3 = Vector3(global_position.x - 2.0, global_position.y, y2)
	#print("p1: ", point1)
	#print("p2: ", point2)
	$debugsphere1.global_position = point1
	$debugsphere2.global_position = point2

	position_line(point1, point2)

func position_line(point1: Vector3, point2: Vector3)->void:
	var sum : Vector3 = Vector3(point1.x+point2.x, point1.y+point2.y, point1.z+point2.z)
	var new_position : Vector3 = Vector3(sum.x/2.0,global_position.y-0.2,sum.z/2.0)
	line.look_at(point1)
	line.global_position = new_position
