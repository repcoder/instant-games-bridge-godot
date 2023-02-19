extends Node

var is_initialized : get = _is_initialized_getter
var platform : get = _platform_getter
var device : get = _device_getter

var _is_initialized = false
var _platform = null
var _device = null

func _is_initialized_getter():
	return _is_initialized

func _platform_getter():
	return _platform

func _device_getter():
	return _device

func initialize():
	if OS.has_feature("JavaScript"):
		_platform = load("res://addons/instant_games_bridge/scripts/platform/platform.gd").new()
		_device = load("res://addons/instant_games_bridge/scripts/device/device.gd").new()
	else:
		_platform = load("res://addons/instant_games_bridge/scripts/platform/platform_mock.gd").new()
		_device = load("res://addons/instant_games_bridge/scripts/device/device_mock.gd").new()
	
	_is_initialized = true
