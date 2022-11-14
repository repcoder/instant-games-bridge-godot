class_name SetScoreOptions

var yandex: SetScoreOptionsYandex


func _init() -> void:
    yandex = SetScoreOptionsYandex.new()


func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.yandex = yandex._convert()
    return options