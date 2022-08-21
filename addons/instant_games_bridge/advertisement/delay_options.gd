class_name DelayOptions

var vk: int = 30
var yandex: int = 60
var mock: int = 0

func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.vk = vk
	options.yandex = yandex
	options.mock = mock
	return options