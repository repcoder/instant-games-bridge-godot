class_name JoinCommunityOptions

var vk: JoinCommunityOptionsVk

func _init() -> void:
    vk = JoinCommunityOptionsVk.new()

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.vk = vk._convert()
    return options