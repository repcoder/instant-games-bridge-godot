# Instant Games Bridge Godot Plugin
Plugin of [InstantGamesBridge](https://github.com/instant-games-bridge/instant-games-bridge) for Godot.

Join community: https://t.me/instant_games_bridge.

## Install
1. Installation
The easiest way to install this plugin is to download the archive from the Releases page and simply unpack it into the project folder. This will add a plugin to your project that you can activate/deactivate.
2. Activation
When the plugin is activated (in Project Settings -> Plugins), a script will be added to the list of singletons (Project Settings -> Autoload), which will make your life easier.
3. Setting up
Initially, the plugin will not work, as it is necessary to add the SDK download script to our export template (Project -> Export.. -> Options -> Head Include):
```html
<script src="https://cdn.jsdelivr.net/gh/mewtongames/instant-games-bridge@1.1.0/dist/instant-games-bridge.js"></script>
```
4. Done!
Now the plugin is fully functional.

## Usage
If you don't know how to work with JavaScript in Godot, we strongly recommend reading at least one of [the reports on the Godot blog](https://godotengine.org/article/godot-web-progress-report-9).

The main functions and methods of working with them are well shown in [example](addons/instant_games_bridge/example/example.gd).

### Setup
#### Via GDScript

```gdscript
# Use signal

# Return 'false' if already initialized or can't load
if InstantGamesBridge.initialize():
    InstantGamesBridge.connect("initalized", self, "_initialized")
else:
    # Can't initialized
    return

# Or use callback

if !InstantGamesBridge.initialize(_initialized_cb):
    # Already Initialized
```
### Via HTML
You can use the original documentation and supplement your template code to make it look something like this:
```html
<script src="https://cdn.jsdelivr.net/gh/mewtongames/instant-games-bridge@1.1.0/dist/instant-games-bridge.js"></script>
<script> 
    instantGamesBridge
        .initialize()
        .then(() => {
            // Initialized. Now you can request to show interstitial ads
            instantGamesBridge
            .advertisement
            .showInterstitial()
        })
</script>
```
This is especially useful if you want to use the SDK before the game loads.

If you have used this method, you no longer need to call initialization in the game.

### Platform
```gdscript
# ID of current platform ('vk', 'yandex', 'mock')
InstantGamesBridge.platform.id # -> String

# Platform native SDK
instantGamesBridge.platform.sdk # -> JavaScriptObject

# If platform provides information - this is the user language on platform. 
# If not - this is the language of the user's browser.
InstantGamesBridge.platform.language # -> String

# The value of the payload parameter from the url. Examples:
# VK: vk.com/app8056947#your-info
# Yandex: yandex.com/games/play/183100?payload=your-info
# Mock: site.com/game?payload=your-info
InstantGamesBridge.platform.payload # -> String
```

### Advertisement
#### Methods
* `set_minimum_delay_between_interstitial(seconds: int) -> void`
* `show_interstitial(ignore_delay = false, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void`
* `show_rewarded(callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void`

Example:
```gdscript
# Delay between interstitial
var seconds = 30 // Default = 60
InstantGamesBridge.advertisement.set_minimum_delay_between_interstitial(seconds)

# Request to show interstitial ads
var ignore_delay = true # Default = false
InstantGamesBridge.advertisement.show_interstitial(ignore_delay)

# Request to show rewarded video ads
InstantGamesBridge.advertisement.show_rewarded()
```
#### Signals
* `interstitial_state_changed(state: String)`
* `rewarded_state_changed(state: String)`

Example:
```gdscript
InstantGamesBridge.advertisement.connect("interstitial_state_changed", self, "_interstitial_state_changed")

func _interstitial_state_changed(state: String) -> void:
    pass
```
### Game Data
* `get_data(key: String, callback: JavaScriptObject, catch_callback: JavaScriptObject = null) -> void`
* `set_data(key: String, value, callback: JavaScriptObject = null, catch_callback: JavaScriptObject = null) -> void`

Example:
```gdscript
# Callbacks
var _get_data_name_cb = JavaScript.create_callback(self, "_get_data_name")

func _get_data_name(args) -> void:
    print("Name is ", args[0])

# Set game data in storage
InstantGamesBridge.game.set_data("name", "John")

# Get game data from storage
InstantGamesBridge.game.get_data("name", _get_data_name_cb)

```