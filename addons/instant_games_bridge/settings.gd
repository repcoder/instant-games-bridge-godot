class_name InstantGamesBridgeSettings


var initialize_automaticly: bool setget , _initialize_automaticly_getter
func _initialize_automaticly_getter() -> bool:
	if not ProjectSettings.has_setting("addons/instant_games_bridge/initialize/initialize_automatically"):
		return false
		
	return ProjectSettings.has_setting("addons/instant_games_bridge/initialize/initialize_automatically")

