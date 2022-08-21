class_name YandexPlayerAuthorizationOptions
extends PlayerAuthorizationOptions

var scopes: bool = true


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.yandex = JavaScript.create_object("Object")
	options.yandex.scopes = scopes
	return options
