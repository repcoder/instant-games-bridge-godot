class_name InstantGamesBridgePlayer
extends Reference

var _interface: JavaScriptObject

var _printerr_cb = JavaScript.create_callback(self, "printerr")


func _init(interface: JavaScriptObject) -> void:
	_interface = interface

var is_authorization_supported: bool setget , _is_authorization_supported_getter
func _is_authorization_supported_getter() -> bool:
	return _interface.isAuthorizationSupported if _interface != null else false

var is_authorized: bool setget , _is_authorized_getter
func _is_authorized_getter() -> bool:
	return _interface.isAuthorized if _interface != null else false

var id: String setget , _id_getter
func _id_getter() -> String:
	return _interface.id if _interface != null else ""

var name: String setget , _name_getter
func _name_getter() -> String:
	return _interface.name if _interface != null else ""

var photos: Array setget , _photos_getter
func _photos_getter() -> Array:
	return _interface.photos if _interface != null else []


func authorize(options: PlayerAuthorizationOptions = null, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.showInterstitial(options._convert() if options != null else null) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)