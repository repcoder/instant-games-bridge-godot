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


func get(key, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.get(key) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func get(key, storage_type: String, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.get(key, storage_type) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func get(key, options: StorageTypeOptions, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.get(key, options._convert()) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func set(key, value, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.set(key, value) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func set(key, value, storage_type: String, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.set(key, value, storage_type) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func set(key, value, options: StorageTypeOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.set(key, value, options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func delete(key, value, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.delete(key, value) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func delete(key, value, storage_type: String, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.delete(key, value, storage_type) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)

func delete(key, value, options: StorageTypeOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.delete(key, value, options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)