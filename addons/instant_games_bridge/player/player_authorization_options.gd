class_name PlayerAuthorizationOptions


func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    return options