class_name JoinCommunityOptionsVk

var groupId: String = ""

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.groupId = groupId
    return options