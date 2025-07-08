extends PathFollow3D
class_name PathCutscene

@export var speed : float = 5.0

func _ready() -> void:
	start(false)

func _physics_process(delta: float) -> void:
	if progress_ratio >= 0.99:
		$Timer.start()
		start(false)
		return
	progress += speed*delta

func start(value: bool = true)->void:
	if value:
		process_mode = Node.PROCESS_MODE_PAUSABLE
	else:
		process_mode = Node.PROCESS_MODE_DISABLED
	
