class_name GetScoreOptionsYandex

var leaderboard_name: String = ""


func _convert() -> JavaScriptObject:
    var options = JavaScript.create_object("Object")
    options.leaderboard_name = leaderboard_name
    return options