class_name GetScoreOptions

var yandex: GetScoreOptionsYandex


func _init() -> void:
	yandex = GetScoreOptionsYandex.new()


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.yandex = yandex._convert()
	return options