extends EditorExportPlugin

const JS_SDK_FILE_NAME = "instant-games-bridge.js"
const JS_SDK_PATH = "res://addons/instant_games_bridge/template/" + JS_SDK_FILE_NAME

func _export_begin(features, is_debug, path, flags):
	if features.has("web"):
		var file_from = File.new()
		file_from.open(JS_SDK_PATH, File.READ)
		var file_to = File.new()
		file_to.open(path.get_base_dir() + "/" + JS_SDK_FILE_NAME, File.WRITE)
		file_to.store_string(file_from.get_as_text())
		file_from = null
		file_to = null
