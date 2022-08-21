class_name CreatePostOptionsVk

var message: String = "Hello world!"
var attachments: String = "photo-199747461_457239629"

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.groupId = groupId
    return options