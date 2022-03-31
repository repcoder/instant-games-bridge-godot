extends Node

var _get_data_cb = JavaScript.create_callback(self, "_apply_data")
var _set_data_cb = JavaScript.create_callback(self, "_saved")

var _adv
var _paltform
var _game

func _ready() -> void:
	logger("Init SDK")
	InstantGamesBridge.initialize()
	InstantGamesBridge.connect("initalized", self, "_initialized")

func _initialized() -> void:
	logger("Initialized")
	_adv = InstantGamesBridge.advertisement
	_paltform = InstantGamesBridge.platform
	_game = InstantGamesBridge.game
	logger("ID: " + _paltform.id)
	logger("Lang: " + _paltform.language)
	logger("Payload: " + str(_paltform.payload))
	
	_adv.connect("interstitial_state_changed", self, "_adv_changed")
	_adv.connect("rewarded_state_changed", self, "_rew_changed")
	
	_adv.showInterstitial(true)


func _adv_changed(state: String):
	logger("New Inter State: " + state)
	
	if state == InterstitialState.Closed:
		_adv.showRewarded()


func _rew_changed(state: String):
	logger("New Reward State: " + state)
	
	if state == RewardState.Rewarded:
		_game.setData("gold", 100, _set_data_cb)
		_game.setData("name", "John", _set_data_cb)
		
		yield(get_tree().create_timer(1.0), "timeout")
		
		_game.getData("gold", _get_data_cb)
		_game.getData("name", _get_data_cb)


func _apply_data(args) -> void:
	logger("Data given: " + str(args[0]))


func _saved(args) -> void:
	logger("Data was saved")

func logger(text):
	$logger.add_text(text + '\n')
