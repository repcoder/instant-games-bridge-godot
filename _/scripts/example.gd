extends Node

func _ready():
	print("Platform ID: " + Bridge.platform.id)

func _on_get_button_pressed():
	Bridge.storage.get("player_data", _on_storage_get_completed)

func _on_set_button_pressed():
	Bridge.storage.set("player_data", "asdf", _on_storage_set_completed)

func _on_delete_button_pressed():
	Bridge.storage.delete("player_data")


func _on_storage_get_completed(success, data):
	print("On Storage Get Completed, success: ")
	print(success)
	
	if success:
		if data != null:
			print("Data: ")
			print(data)
		else:
			print("Data is null")

func _on_storage_set_completed(success):
	print("On Storage Set Completed, success: ")
	print(success)
