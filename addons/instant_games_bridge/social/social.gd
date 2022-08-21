class_name InstantGamesBridgeSocial
extends Reference

var _interface: JavaScriptObject

var _printerr_cb = JavaScript.create_callback(self, "printerr")


func _init(interface: JavaScriptObject) -> void:
	_interface = interface


var is_share_supported: bool setget , _is_share_supported_getter
func _is_share_supported_getter() -> bool:
	return _interface.isShareSupported if _interface != null else false

var is_join_community_supported: bool setget , _is_join_community_supported_getter
func _is_join_community_supported_getter() -> bool:
	return _interface.isJoinCommunitySupported if _interface != null else false

var is_invite_friends_supported: bool setget , _is_invite_friends_supported_getter
func _is_invite_friends_supported_getter() -> bool:
	return _interface.isInviteFriendsSupported if _interface != null else false

var is_create_post_supported: bool setget , _is_create_post_supported_getter
func _is_create_post_supported_getter() -> bool:
	return _interface.isCreatePostSupported if _interface != null else false

var is_add_to_favorites_supported: bool setget , _is_add_to_favorites_supported_getter
func _is_add_to_favorites_supported_getter() -> bool:
	return _interface.isAddToFavoritesSupported if _interface != null else false

var is_add_to_home_screen_supported: bool setget , _is_add_to_home_screen_supported_getter
func _is_add_to_home_screen_supported_getter() -> bool:
	return _interface.isAddToHomeScreenSupported if _interface != null else false

var is_rate_supported: bool setget , _is_rate_supported_getter
func _is_rate_supported_getter() -> bool:
	return _interface.isRateSupported if _interface != null else false


func share(options: ShareOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.share(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func join_community(options: JoinCommunityOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return 
	
	_interface.joinCommunity(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func invite_friends(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.inviteFriends() \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func create_post(options: CreatePostOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return 
	
	_interface.createPost(options) \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func add_to_home_screen(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.addToHomeScreen() \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func invite_add_to_favorites(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.addToFavorites() \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)


func rate(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void:
	if _interface == null: return
	
	_interface.rate() \
		.then(callback) \
		.catch(catch_callback if catch_callback != null else _printerr_cb)
