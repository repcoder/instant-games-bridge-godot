class_name InterstitialOptions

var vk: bool = false
var yandex: bool = false


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.vk = vk
	options.yandex = yandex
	return options