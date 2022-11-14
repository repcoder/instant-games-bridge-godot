class_name CreatePostOptions

var vk: CreatePostOptionsVk

func _init() -> void:
    vk = CreatePostOptionsVk.new()

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.vk = vk._convert()
    return options