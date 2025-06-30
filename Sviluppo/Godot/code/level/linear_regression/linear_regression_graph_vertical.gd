@tool
extends LinearRegressionGraph
class_name LinearRegressionGraphVertical

func _physics_process(delta: float) -> void:
	line.rotation = Vector3.ZERO
	calculate_a_b()
	line.rotation.x = 0.0
	line.rotation.z = 0.0
	

func add_point(new_point_position: Vector3)->void:
	var new_point : GraphPoint = preload("res://levels/assets/graph_point.tscn").instantiate()
	points.add_child(new_point)
	new_point.custom = true
	new_point.global_position = new_point_position
	calculate_a_b()
	line.rotation.x = 0.0
	new_point.position.y = 1.0

func reset_points()->void:
	line.rotation = Vector3.ZERO
	for i in points.get_child_count():
		if points.get_child(i).custom:
			points.get_child(i).queue_free()
	calculate_a_b()
	line.rotation.x = 0.0
	
func calculate_a_b()->void:
	var sum_x : float = 0.0
	var sum_x2 : float = 0.0
	var sum_y : float = 0.0
	var sum_y2 : float = 0.0
	var sum_xy : float = 0.0
	var num : float = 0.0
	
	for i in points.get_child_count():
		num += 1
		sum_x += points.get_child(i).position.x
		sum_y += points.get_child(i).position.z
		sum_x2 += (points.get_child(i).position.x)**2
		sum_y2 += (points.get_child(i).position.z)**2
		sum_xy += (points.get_child(i).position.z)*(points.get_child(i).position.x)
	var a = (sum_y*sum_x2 - sum_x*sum_xy)/(num*(sum_x2) - (sum_x)**2)
	var b = (num*(sum_xy)-sum_x*sum_y)/(num*(sum_x2)-(sum_x)**2)
	var center : Vector3 = Vector3(sum_x/num, position.y, sum_y/num)
	calculate_pos_rot(a, b, center)

func calculate_pos_rot(a: float, b: float, center: Vector3)->void:
	var y1 = a + b * (center.x + 1.0)
	var y2 = a + b * (center.x - 1.0)
	var point1 : Vector3 = Vector3(center.x + 1.0, position.y, y1)
	var point2 : Vector3 = Vector3(center.x - 1.0, position.y, y2)
	$debugsphere1.position = point1
	$debugsphere2.position = point2
	position_line(point1, point2)

func position_line(point1: Vector3, point2: Vector3)->void:
	var sum : Vector3 = Vector3(point1.x+point2.x, point1.y+point2.y, point1.z+point2.z)
	var new_position : Vector3 = Vector3(sum.x/2.0,0.0,sum.z/2.0)
	line.position = new_position
	line.look_at($debugsphere1.global_position)
	#line.rotation.y = calculate_angle(point1, point2) 

func calculate_angle(point1: Vector3, point2: Vector3)->float:
	var i : float = point1.distance_to(point2)
	var cy : float = point1.z - point2.z
	var cx : float = point1.x - point2.x
	return (cos(cx/i)**-1)
