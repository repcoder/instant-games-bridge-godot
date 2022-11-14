class_name ShareOptionsVk

var link: String = ""

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.link = link
    return options