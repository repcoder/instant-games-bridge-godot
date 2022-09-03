class_name InstantGamesBridgeStorage
extends Reference

var _interface: JavaScriptObject

var _printerr_cb = JavaScript.create_callback(self, "printerr")


func _init(interface: JavaScriptObject) -> void:
	_interface = interface


var default_type: String setget , _default_type_getter
func _default_type_getter() -> String:
	return _interface.defaultType if _interface != null else "local_storage"

func is_supported(storage_type: String) -> bool:
	return _interface.isSupported(storage_type) if _interface != null else false


func get_data(key, storage, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	if storage == null:
		_interface.call("get", key) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage.typeof() == TYPE_STRING:
		_interface.call("get", key, storage) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage is StorageTypeOptions:
		_interface.call("get", key, storage._convert()) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)


func set_data(key, value, storage = null, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	if storage == null:
		_interface.call("set", key, value) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage.typeof() == TYPE_STRING:
		_interface.call("set", key, value, storage) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage is StorageTypeOptions:
		_interface.call("set", key, value, storage._convert()) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)


func delete_data(key, value, storage = null, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	if storage == null:
		_interface.call("delete", key, value) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage.typeof() == TYPE_STRING:
		_interface.call("delete", key, value, storage) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif storage is StorageTypeOptions:
		_interface.call("delete", key, value, storage._convert()) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
