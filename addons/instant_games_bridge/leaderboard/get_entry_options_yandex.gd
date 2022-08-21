class_name GetEntryOptionsYandex

var leaderboard_name: String = ""
var include_user: bool = false
var quantity_around: int = 5
var quantity_top: int = 5


func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.leaderboard_name = leaderboard_name
    options.include_user = include_user
    options.quantity_around = quantity_around
    options.quantity_top = quantity_top
    return options