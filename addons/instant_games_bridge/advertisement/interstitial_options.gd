class_name InterstitialOptions

var vk: InterstitialOptions
var yandex: InterstitialOptions


func _init() -> void:
	vk = InterstitialOptions.new()
	yandex = InterstitialOptions.new()


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.vk = vk._convert()
	options.yandex = yandex._convert()
	return options