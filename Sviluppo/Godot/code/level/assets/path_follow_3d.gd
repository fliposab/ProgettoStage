extends PathFollow3D
class_name PathCutscene

signal stop_following

@export var speed : float = 5.0

func _ready() -> void:
	start(false)
	for i in get_child_count()-2:
		stop_following.connect(get_child(i).on_stop_following)

func _physics_process(delta: float) -> void:
	if progress_ratio >= 0.99:
		$Timer.start()
		start(false)
		return
	progress += speed*delta

func start(value: bool = true)->void:
	if value:#await get_tree().process_frame
	#global_position = get_parent().global_position
		process_mode = Node.PROCESS_MODE_PAUSABLE
	else:
		process_mode = Node.PROCESS_MODE_DISABLED

func stop_follow()->void:
	stop_following.emit()
	
