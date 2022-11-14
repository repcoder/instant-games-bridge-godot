class_name InstantGamesBridgeLeaderboard
extends Reference

var _interface: JavaScriptObject

var _printerr_cb = JavaScript.create_callback(self, "printerr")


func _init(interface: JavaScriptObject) -> void:
	_interface = interface


var is_supported: bool setget , _is_share_getter
func _is_share_getter() -> bool:
	return _interface.isSupported if _interface != null else false

var is_native_popup_supported: bool setget , _is_native_popup_supported_getter
func _is_native_popup_supported_getter() -> bool:
	return _interface.isNativePopupSupported if _interface != null else false

var is_multiple_boards_supported: bool setget , _is_multiple_boards_supported_getter
func _is_multiple_boards_supported_getter() -> bool:
	return _interface.isMultipleBoardsSupported if _interface != null else false

var is_set_score_supported: bool setget , _is_set_score_supported_getter
func _is_set_score_supported_getter() -> bool:
	return _interface.isSetScoreSupported if _interface != null else false

var is_get_score_supported: bool setget , _is_get_score_supported_getter
func _is_get_score_supported_getter() -> bool:
	return _interface.isGetScoreSupported if _interface != null else false

var is_get_entries_supported: bool setget , _is_get_entries_supported_getter
func _is_get_entries_supported_getter() -> bool:
	return _interface.isGetEntriesSupported if _interface != null else false


func set_score(options: SetScoreOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.setScore(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func get_score(options: GetScoreOptions, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return 
	
	_interface.getScore(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func get_entries(options: GetEntryOptions, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.getEntries(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func show_native_popup(options: NativePopupOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return 
	
	_interface.showNativePopup(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


