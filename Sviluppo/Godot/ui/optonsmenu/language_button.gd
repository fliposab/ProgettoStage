extends OptionsButton

func _on_item_selected(index: int) -> void:
	var language : String = option_button.get_item_text(index)
	match language:
		"Italiano":
			TranslationServer.set_locale("it")
		"English":
			TranslationServer.set_locale("en")
	pass_value.emit("language", language)

func check_load_language(locale: String) -> void:
	match locale:
		"Italiano":
			TranslationServer.set_locale("it")
		"English":
			TranslationServer.set_locale("en")
	pass_value.emit("language", locale)

func check_selected_item(saves_handler) -> void:
	check_load_language(saves_handler.language)
	set_selected_item(saves_handler.language)

func set_selected_item(language: String) -> void:
	for i in option_button.item_count:
		if option_button.get_item_text(i) == language:
			option_button.selected = i
	
