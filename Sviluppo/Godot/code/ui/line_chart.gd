extends GridContainer
class_name LineChart

@export var line_width = 3
@export var line_color : Color
@export var bg_color : Color

@export var x_label = ""
@export var y_label = ""

@export var x_ticks = 7
@export var y_ticks = 5

var x_numerical = true
var y_numerical = true

var min_x
var min_y
var max_x
var max_y

var line_rect_width
var line_rect_height

var line_rect_x
var line_rect_y

@export var data = [
	{'x': 1, 'y':25},
	{'x': 2, 'y':36},
	{'x': 3, 'y':30},
	{'x': 4, 'y':33},
	{'x': 5, 'y':30},
	{'x': 6, 'y':32},
	{'x': 7, 'y':36},
]

func draw_line_chart()->void:
	# generate line and apply style
	var line = Line2D.new()
	line.antialiased = true
	line.width = line_width
	line.default_color = line_color
	$line_container.add_child(line)
	
	$x_label.text = x_label
	$y_label.text = y_label
	#$line_container/PanelContainer/background.color = bg_color
	
	# check if values are numerical
	for val in data:
		if not [TYPE_INT, TYPE_FLOAT].has(typeof(val['x'])):
			x_numerical = false
		if not [TYPE_INT, TYPE_FLOAT].has(typeof(val['y'])):
			y_numerical = false
		
	# get min and max values (use index if value isn't a number, e.g. weekdays)
	for i in range(len(data)):
		var x_val = get_val(data[i]['x'], i)
		var y_val = get_val(data[i]['y'], i)
		
		
		if min_x == null or x_val < min_x:
			min_x = x_val
		if max_x == null or x_val > max_x:
			max_x = x_val
		if min_y == null or y_val < min_y:
			min_y = y_val
		if max_y == null or y_val > max_y:
			max_y = y_val
	
	# add tick labels to each axis
	for i in range(x_ticks):
		var x_tick = Label.new()
		x_tick.size_flags_horizontal = SIZE_EXPAND_FILL
		x_tick.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		if x_numerical:
			x_tick.text = str(round(i * (max_x-min_x) / (x_ticks-1) + min_x)) # optional rounding
		else:
			x_tick.text = str(data[i]['x'])
		$x_ticks_container.add_child(x_tick)

	for i in range(y_ticks-1, -1, -1):
		var y_tick : YTick = preload("res://ui/graphs/y_tick.tscn").instantiate()
		if y_numerical:
			y_tick.set_text(str(round(i * (max_y-min_y) / (y_ticks-1) + min_y))) # optional rounding
		else:
			y_tick.set_text(str(data[y_ticks-i-1]['y']))
		$y_ticks_container.add_child(y_tick)
	
	# fix updated rect sizes not having correct values after altering labels
	await get_tree().process_frame
	# shape the line
	line_rect_width = $line_container.size.x
	line_rect_height = $line_container.size.y
	
	line_rect_x = (line_rect_width / x_ticks)
	line_rect_y = (line_rect_height / y_ticks)
	
	line_rect_width = line_rect_x * (x_ticks-1)
	line_rect_height = line_rect_y * (y_ticks-1)
	
	line.position -= Vector2(0.0,25.0)
	for i in range(len(data)):
		var scaled_x = scale_x(get_val(data[i]['x'], i))
		var scaled_y = scale_y(get_val(data[i]['y'], i))
		line.add_point(Vector2(scaled_x, scaled_y))
	
func delete_line_chart()->void:
	if !$line_container.get_child(0):
		return
	$line_container.get_child(0).queue_free()
	for i in range(x_ticks):
		$x_ticks_container.get_child(i).queue_free()
	for i in range(y_ticks-1, -1, -1):
		$y_ticks_container.get_child(i).queue_free()

func scale_x(val):
	var dx = max_x - min_x
	return ((val - min_x) * line_rect_width / dx) + line_rect_x/2


func scale_y(val):
	var dy = max_y - min_y
	return line_rect_height - ((val - min_y) * line_rect_height / dy) + line_rect_y/2


func get_val(val, idx):
	if [TYPE_INT, TYPE_FLOAT].has(typeof(val)):
		return val
	return idx
