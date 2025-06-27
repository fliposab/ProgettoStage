extends CharacterBody3D
class_name TrainingImage

@export var id : String

var _spawn_position : Vector3
var holding : bool = false
var og_parent : Node

func _ready()->void:
	og_parent = get_parent()
	_spawn_position = global_position
	
func _physics_process(delta: float) -> void:
	if !is_on_floor() and !holding:
		velocity -= -get_gravity()*delta
	move_and_slide()

func return_to_spawn()->void:
	if holding:
		move_node(og_parent, false)
	toggle_grab(true)
	global_position = _spawn_position

func move_node(new_parent, grab = true): # node - the node that you want to move, new_parent - where you want to move the node
	var keep_position : Vector3 = global_position
	self.get_parent().remove_child(self) # Get node's parent and remove node from it    
	new_parent.add_child(self) # Add node to new parent as a child   
	if grab:
		position = Vector3(0.0,5.0,0.0)
	else:
		global_position = keep_position - Vector3(0.0,0.55,0.0)

func toggle_grab(value=true):
	set_collision_layer_value(5, value)
