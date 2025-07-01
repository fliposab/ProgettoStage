extends Button
class_name DogBreedButton

@export var breed_name : String 
@export var image_unlocked: Texture2D
@export var image_locked: Texture2D
@onready var text_rect : TextureRect = $TextureRect
@onready var label : Label = $Label

var _unlocked : bool = false

func _ready() -> void:
	text_rect.texture = image_locked
	label.text = "???"
	
func unlock():
	_unlocked = true
	text_rect.texture = image_unlocked
	label.text = breed_name
