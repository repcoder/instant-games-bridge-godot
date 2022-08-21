class_name SetScoreOptionsYandex

var leaderboard_name: String = ""
var score: int = 0


func _convert() -> JavaScriptObject:
	var options = JavaScript.create_object("Object")
	options.leaderboard_name = leaderboard_name
	options.score = score
	return options