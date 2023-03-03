extends Node


const DeviceType = {
	DESKTOP = "desktop",
	MOBILE = "mobile",
	TABLET = "tablet",
	TV = "tv"
}

const VisibilityState = {
	VISIBLE = "visible",
	HIDDEN = "hidden"
}

const PlatformMessage = {
	GAME_LOADING_STARTED = "game_loading_started",
	GAME_LOADING_STOPPED = "game_loading_stopped",
	GAMEPLAY_STARTED = "gameplay_started",
	GAMEPLAY_STOPPED = "gameplay_stopped",
	PLAYER_GOT_ACHIEVEMENT = "player_got_achievement"
}

const StorageType = {
	LOCAL_STORAGE = "local_storage",
	PLATFORM_INTERNAL = "platform_internal"
}


var platform : get = _platform_getter
var device : get = _device_getter
var player : get = _player_getter
var game : get = _game_getter
var storage : get = _storage_getter


func _platform_getter():
	return _platform

func _device_getter():
	return _device

func _player_getter():
	return _player

func _game_getter():
	return _game
	
func _storage_getter():
	return _storage

var _platform = null
var _device = null
var _player = null
var _game = null
var _storage = null


func _init():
	if OS.has_feature("web"):
		var js_bridge = JavaScriptBridge.get_interface("bridge")
		_platform = load("res://addons/instant_games_bridge/scripts/platform/platform.gd").new(js_bridge.platform)
		_device = load("res://addons/instant_games_bridge/scripts/device/device.gd").new(js_bridge.device)
		_player = load("res://addons/instant_games_bridge/scripts/player/player.gd").new(js_bridge.player)
		_game = load("res://addons/instant_games_bridge/scripts/game/game.gd").new(js_bridge.game)
		_storage = load("res://addons/instant_games_bridge/scripts/storage/storage.gd").new(js_bridge.storage)
	else:
		_platform = load("res://addons/instant_games_bridge/scripts/platform/platform_editor_mock.gd").new()
		_device = load("res://addons/instant_games_bridge/scripts/device/device_editor_mock.gd").new()
		_player = load("res://addons/instant_games_bridge/scripts/player/player_editor_mock.gd").new()
		_game = load("res://addons/instant_games_bridge/scripts/game/game_editor_mock.gd").new()
		_storage = load("res://addons/instant_games_bridge/scripts/storage/storage_editor_mock.gd").new()
