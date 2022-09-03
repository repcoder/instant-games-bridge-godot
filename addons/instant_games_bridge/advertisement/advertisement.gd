class_name InstantGamesBridgeAdvertisement
extends Reference

signal interstitial_state_changed(state)
signal rewarded_state_changed(state)

var _interface: JavaScriptObject

var _interstitial_state_changed_cb = JavaScript.create_callback(self, "_interstitial_state_changed")
var _rewarded_state_changed_cb = JavaScript.create_callback(self, "_rewarded_state_changed")
var _printerr_cb = JavaScript.create_callback(self, "printerr")


var minimum_delay_between_interstitial: int setget , _minimum_delay_between_interstitial_getter
func _minimum_delay_between_interstitial_getter() -> int:
	return _interface.minimumDelayBetweenInterstitial  if _interface != null else 60


func _init(interface: JavaScriptObject) -> void:
	_interface = interface
	
	_interface.on('interstitial_state_changed', _interstitial_state_changed_cb)
	_interface.on('rewarded_state_changed', _rewarded_state_changed_cb)


func _interstitial_state_changed(args) -> void:
	emit_signal("interstitial_state_changed", str(args[0]))


func _rewarded_state_changed(args) -> void:
	emit_signal("rewarded_state_changed", str(args[0]))


func set_minimum_delay_between_interstitial(delay) -> void:
	if _interface == null: return

	if typeof(delay) == TYPE_INT:
		var options = JavaScript.create_object("Object")
		options.delay = delay
		
		_interface.setMinimumDelayBetweenInterstitial(options)
	elif delay is DelayOptions:
		_interface.setMinimumDelayBetweenInterstitial(delay._convert())
	else:
		printerr("Error: delay.type != int || DelayOptions")


func show_interstitial(ignoreDelay = false, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return

	if typeof(ignoreDelay) == TYPE_BOOL:
		var options = JavaScript.create_object("Object")
		options.ignoreDelay = ignoreDelay

		_interface.showInterstitial(options) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	elif ignoreDelay is InterstitialOptions:
		_interface.showInterstitial(ignoreDelay._convert()) \
			.then(callback) \
			.catch(catch_callback if catch_callback != null else _printerr_cb)
	else:
		printerr("Error: ignoreDelay.type != bool || InterstitialOptions")


func show_rewarded(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.showRewarded() \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)
