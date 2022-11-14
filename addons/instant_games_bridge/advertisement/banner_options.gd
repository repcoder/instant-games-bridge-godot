class_name BannerOptions

var vk: BannerOptionsVk

func _init() -> void:
	vk = BannerOptionsVk.new()

func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.vk = vk
	return options