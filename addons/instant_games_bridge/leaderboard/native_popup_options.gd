class_name NativePopupOptions

var vk: NativePopupOptionsVk


func _init() -> void:
	vk = NativePopupOptionsVk.new()


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.vk = vk._convert()
	return options