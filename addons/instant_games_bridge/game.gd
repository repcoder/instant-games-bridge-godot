class_name InstantGamesBridgeGame
extends Reference

var _interface: JavaScriptObject


func _init(interface: JavaScriptObject) -> void:
	_interface = interface


func get_data(key: String, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.getData(key) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else InstantGamesBridge._printerr_cb)


func set_data(key: String, value, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.setData(key, value) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else InstantGamesBridge._printerr_cb)
