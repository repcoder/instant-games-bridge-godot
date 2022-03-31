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
```
<script src="https://cdn.jsdelivr.net/gh/mewtongames/instant-games-bridge@1.1.0/dist/instant-games-bridge.js"></script>
```
4. Done!
Now the plugin is fully functional.

## Usage
The plugin aims to be just a convenient wrapper over the code that is used to communicate with JavaScript. However, it is still different due to the peculiarities of working with JavaScript in Godot and some syntactic differences between GDScript and JavaScript.

If you don't know how to work with JavaScript in Godot, we strongly recommend reading at least one of [the reports on the Godot blog](https://godotengine.org/article/godot-web-progress-report-9).

The main functions and methods of working with them are well shown in the example.
