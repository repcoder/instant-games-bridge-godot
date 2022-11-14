# Instant Games Bridge Godot Plugin
Plugin of [InstantGamesBridge](https://github.com/instant-games-bridge/instant-games-bridge) for Godot.

Roadmap: https://trello.com/b/NjF29vTW.

Join community: https://t.me/instant_games_bridge.

## Install
1. Installation
The easiest way to install this plugin is to download the archive from the Releases page and simply unpack it into the project folder. This will add a plugin to your project that you can activate/deactivate.
2. Activation
When the plugin is activated (in Project Settings -> Plugins), a script will be added to the list of singletons (Project Settings -> Autoload), which will make your life easier.
4. Done!
Now the plugin is fully functional.

## Usage
+ [Setup](#setup)
+ [Platform](#platform)
+ [Advertisement](#advertisement)
+ [Game](#game)
+ [Storage](#storage)
+ [Social](#social)
+ [LeaderBoard](#leaderboard)

> :warning: **Warning!** If you don't know how to work with JavaScript in Godot, we strongly recommend reading at least one of [the reports on the Godot blog](https://godotengine.org/article/godot-web-progress-report-9).

> The main functions and methods of working with them are well shown in [example](addons/instant_games_bridge/example/example.gd).

### Setup
All plugin settings are stored in `Project Settings - > General -> Addons -> Instant Games Bridge`.

#### Initialize
If the automatic initialization option is enabled, then you do not need to initialize the sdk manually, only to determine that the sdk is initialized.

> :warning: **Try not to initialize the sdk twice!** This can create some problems.

Example:
```gdscript
# Init automaticly
if InstantGamesBridge.settings.initialize_automaticly:
    # In case the sdk has not had time to initialize yet
    while not InstantGamesBridge.is_initialized:
        yield(get_tree(), "idle_frame")
    _initialized()
else:
    # Init manual with signal
    if InstantGamesBridge.initialize():
        InstantGamesBridge.connect("initalized", self, "_initialized")
        return
    else:
        # Can't initialized
        return

    # Or use callback
    if !InstantGamesBridge.initialize(_initialized_cb):
        # Already Initialized
```

### Platform
#### Parameters
```gdscript
# ID of current platform ('vk', 'yandex', 'mock')
# (or Platform.VK, Platform.YANDEX, Platform.MOCK)
id # -> String

# Platform native SDK
sdk # -> JavaScriptObject

# If platform provides information - this is the user language on platform. 
# If not - this is the language of the user's browser.
language # -> String

# The value of the payload parameter from the url. Examples:
# VK: vk.com/app8056947#your-info
# Yandex: yandex.com/games/play/183100?payload=your-info
# Mock: site.com/game?payload=your-info
payload # -> String
```

### Advertisement
#### Parameters
```gdscript
# Banners
is_banner_supported # -> bool
is_banner_showing # -> bool

# Delays Between Interstitials
# Default = 60 seconds
minimum_delay_between_interstitial # -> int
```
#### Options
```gdscript
# Banners 
bannersOptions
    vk: bannersOptionsVk

bannersOptionsVk
    position: String # default = "bottom"

# You can override minimum delay. You can use platform specific delays:
delayDelayOptions
    vk: int
    yandex: int
    mock: int

# You can use platform specific ignoring:
InterstitialOptions
    vk.ignoreDelay: bool
    yandex.ignoreDelay: bool
```
#### Methods
```gdscript
show_banner(options: BannerOptions) -> void
hide_banner() -> void

set_minimum_delay_between_interstitial(delay: int) -> void
# or
set_minimum_delay_between_interstitial(delay: DelayOptions) -> void

show_interstitial(ignore_delay = false, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
# or
show_interstitial(ignore_delay: InterstitialOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void

show_rewarded(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
```

Example:
```gdscript
# Delay between interstitial
var seconds = 30 // Default = 60
InstantGamesBridge.advertisement.set_minimum_delay_between_interstitial(seconds)

# Or with options
var delay_options = DelayOptions.new()
delay_options.vk = 30
delay_options.yandex = 60
delay_options.mock = 0

InstantGamesBridge.advertisement.set_minimum_delay_between_interstitial(delay_options)


# Request to show interstitial ads
var ignore_delay = true # Default = false
InstantGamesBridge.advertisement.show_interstitial(ignore_delay)

# Or with options

var interstitial_options = InterstitialOptions.new()
interstitial_options.vk.ignore_delay = false
interstitial_options.yandex.ignore_delay = true

InstantGamesBridge.advertisement.show_interstitial(interstitial_options)

# Request to show rewarded video ads
InstantGamesBridge.advertisement.show_rewarded()
```
#### Signals
```gdscript
interstitial_state_changed(state: String)
rewarded_state_changed(state: String)
```

Example:
```gdscript
InstantGamesBridge.advertisement.connect("interstitial_state_changed", self, "_interstitial_state_changed")

func _interstitial_state_changed(state: String) -> void:
    match state:
        InterstitialState.OPENED:
            pass
        InterstitialState.CLOSED:
            pass
        InterstitialState.FAILED:
            pass
```
### Storage
#### Options
```gdscript
# You can choose storage type for each platform separately:
# You can use StorageType.LOCAL_STORAGE or StorageType.PLATFORM_INTERNAL constants
StorageTypeOptions
    vk: String
    yandex: String
```
#### Methods
```gdscript
is_supported(storage_type: String) -> bool

get_data(key, storage, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void
set_data(key, value, storage = null, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
delete_data(key, value, storage = null, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
```

Example:
```gdscript
# Callbacks
var _get_data_name_cb = JavaScript.create_callback(self, "_get_data_name")

func _get_data_name(args) -> void:
    print("Name is ", args[0])

# Set game data in storage
InstantGamesBridge.storage.set_data("name", "John", StorageType.PLATFORM_INTERNAL)
# The variable `storage` can be either `null`, `String`, and `StorageTypeOptions`
InstantGamesBridge.storage.get_data("name", "John", null, _get_data_name_cb)

# Get game data from storage with options
var options = StorageTypeOptions.new()
options.vk = StorageType.PLATFORM_INTERNAL
options.yandex = StorageType.LOCAL_STORAGE
InstantGamesBridge.storage.get_data("name", options, _get_data_name_cb)

# You can send an array of keys and values, but this experimental
InstantGamesBridge.storage.get_data(['key_1', 'key2'], null, _get_data_name_cb)
InstantGamesBridge.storage.set_data(['key_1', 'key2'], ['key_1', 'key2'])
InstantGamesBridge.storage.delete_data(['key_1', 'key2'])
```

### Social
```gdscript
ShareOptions
    vk.link: string

JoinCommunityOptions 
    vk.group_id: string

CreatePostOptions 
    vk.message: string
    vk.attachments: string
```
#### Parameters
```gdscript
# VK: true
# Yandex: false
is_share_supported # -> bool
is_join_community_supported # -> bool
is_invite_friends_supported # -> bool
is_create_post_supported # -> bool
is_add_to_favorites_supported # -> bool

# VK, Yandex: partial supported
is_add_to_home_screen_supported # -> bool

# VK: false
# Yandex: true
is_rate_supported # -> bool
```

#### Methods
```gdscript
share(options: ShareOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
join_community(options: JoinCommunityOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
invite_friends(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
create_post(options: CreatePostOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
add_to_home_screen(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
invite_add_to_favorites(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
rate(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
```

Example:
```gdscript
if InstantGamesBridge.social.is_join_community_supported:
    var options = CreatePostOptions.new() 
    options.vk.message = "Hello world!"
    options.vk.attachments = "photo-199747461_457239629"
    InstantGamesBridge.social.join_community(options)
```


### Leaderboard
```gdscript
GetScoreOptions 
    yandex.leaderboard_name: string

SetScoreOptions 
    yandex.leaderboard_name: String
    yandex.score: int

GetEntriesOptions  
    yandex.leaderboard_name: String
    yandex.include_user: bool
    yandex.quantity_around: int
    yandex.quantity_top: int

NativePopupOptions 
    vk.user_result: int
    vk.global: bool
```
#### Parameters
```gdscript
# VK, Yandex: true
is_supported # -> bool

# VK: true
# Yandex: false
is_native_popup_supported # -> bool

# VK: false
# Yandex: true
is_multiple_boards_supported # -> bool
is_set_score_supported # -> bool
is_get_score_supported # -> bool
is_get_entries_supported # -> bool
```

#### Methods
```gdscript
set_score(options: SetScoreOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
get_score(options: GetScoreOptions, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void
get_entries(options: GetEntryOptions, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void
show_native_popup(options: NativePopupOptions, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void
```

Example:
```gdscript
# Callbacks
var _get_score_cb = JavaScript.create_callback(self, "_get_score")
var _get_entries_cb = JavaScript.create_callback(self, "_get_entries")

func _get_score(args) -> void:
    print("Score: ", args[0])

func _get_entries(args) -> void:
    for e in args[0]:
        print('ID: ' + e.id + ', name: ' + e.name + ', score: ' + e.score + ', rank: ' + e.rank + ', small photo: ' + e.photos[0])

var set_score_options = SetScoreOptions.new() 
set_score_options.yandex.leaderboardName = "YOU_LEADERBOARD_NAME"
set_score_options.yandex.score = 42

InstantGamesBridge.leaderboard.set_score(set_score_options)


var get_score_options = GetScoreOptions.new() 
get_score_options.yandex.leaderboardName = "YOU_LEADERBOARD_NAME"

InstantGamesBridge.leaderboard.getScore(get_score_options, _get_score_cb)


var get_entries_options = GetEntriesOptions.new()

get_entries_options.yandex.leaderboardName = "YOU_LEADERBOARD_NAME",
get_entries_options.yandex.includeUser = true, # Default = false
get_entries_options.yandex.quantityAround = 10, # Default = 5
get_entries_options.yandex.quantityTop = 10 # Default = 5

InstantGamesBridge.leaderboard.get_entries(get_entries_options, _get_entries_cb)


var show_native_popup_options = ShowNativePopupOptions.new()

show_native_popup_options.vk.userResult = 42,
show_native_popup_options.vk.global = true # Default = false

InstantGamesBridge.leaderboard.show_native_popup(show_native_popup_options)
```