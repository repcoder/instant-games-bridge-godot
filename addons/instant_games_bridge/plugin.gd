@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("Bridge", "res://addons/instant_games_bridge/bridge.gd")


func _exit_tree():
	remove_autoload_singleton("Bridge")
