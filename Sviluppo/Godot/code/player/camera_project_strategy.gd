extends Node
class_name CameraProjectStrategy

var _items : Array[Control]

func _ready()->void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	for i in _items.size():
		_items[i].position = owner.unproject_position(_items[i].owner.ui_position.global_position)


func add_item(item: Control)->void:
	_items.push_back(item)
	process_mode = Node.PROCESS_MODE_INHERIT

func remove_item(item: Control)->void:
	for i in _items.size():
		if _items[i] == item:
			_items.remove_at(i)
			break
	if _items.size() == 0:
		process_mode = Node.PROCESS_MODE_DISABLED

func project_items()->void:
	pass
