class_name GetEntryOptions

var yandex: GetEntryOptionsYandex


func _init() -> void:
	yandex = GetEntryOptionsYandex.new()


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.yandex = yandex._convert()
	return options