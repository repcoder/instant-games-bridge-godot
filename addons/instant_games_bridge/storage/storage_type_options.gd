class_name StorageTypeOptions

var vk: String = StorageType.LOCAL_STORAGE
var yandex: String = StorageType.LOCAL_STORAGE

func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.vk = vk
    options.yandex = yandex
    return options