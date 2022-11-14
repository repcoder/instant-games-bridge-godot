class_name NativePopupOptionsVk

var user_result: int = 0
var global: bool = false


func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.user_result = user_result
    options.global = global
    return options