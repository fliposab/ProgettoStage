extends Saves
class_name  CausalitySaves

func save_data()->void:
	var config := ConfigFile.new()
	config.set_value("causality", "all_ac_turned_on", stats.ac_on_all)
	#config.set_value("causality", "question_answered", stats.question_answered)
	config.save(SAVE_PATH)

func load_data() -> void:
	var config := ConfigFile.new()
	var err = config.load(SAVE_PATH)
	# If the file didn't load, ignore it.
	if err != OK:
		printerr("SaveFile ",self.name," not found")
		return
	
	config.load(SAVE_PATH)
	stats.ac_on_all = load_var(stats.ac_on_all, config, "causality", "all_ac_turned_on")
	#stats.question_answered = load_var(stats.question_answered, config, "causality", "question_answered")
