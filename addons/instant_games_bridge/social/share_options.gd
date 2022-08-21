class_name ShareOptions

var vk: ShareOptionsVk

func _init() -> void:
    vk = ShareOptionsVk.new()

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.vk = vk._convert()
    return options