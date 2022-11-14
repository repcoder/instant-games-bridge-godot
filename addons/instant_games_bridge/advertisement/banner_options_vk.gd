class_name BannerOptionsVk

var position: String = "bottom"

func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.position = position
	return options