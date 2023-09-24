extends Node

func _on_platform_button_pressed():
	get_tree().change_scene("res://examples/scenes/platform.tscn")

func _on_device_button_pressed():
	get_tree().change_scene("res://examples/scenes/device.tscn")

func _on_player_button_pressed():
	get_tree().change_scene("res://examples/scenes/player.tscn")

func _on_game_button_pressed():
	get_tree().change_scene("res://examples/scenes/game.tscn")
