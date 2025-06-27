extends Node

func _ready():
	var gdllama = $GDLlama
	
	var generated_text = gdllama.generate_text_simple("In this level you will need to use linear regression")
	print(generated_text)
	
	gdllama.generate_text_updated.connect(_on_gdllama_updated)
	gdllama.run_generate_text("Hello", "", "")

func _on_gdllama_updated(new_text: String):
	print(new_text)
