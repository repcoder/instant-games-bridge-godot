extends Node

func _ready():
	print("Platform ID: ", Bridge.platform.id)

func _on_get_button_pressed():
	Bridge.storage.get(["level", "is_tutorial_completed", "coins"], funcref(self, "_on_storage_get_completed"))

func _on_set_button_pressed():
	Bridge.storage.set(["level", "is_tutorial_completed", "coins"], ["dungeon_123", true, 42], funcref(self, "_on_storage_set_completed"))

func _on_delete_button_pressed():
	Bridge.storage.delete(["level", "is_tutorial_completed", "coins"])


func _on_storage_get_completed(success, data):
	print("On Storage Get Completed, success: ", success)
	if success:
		if data != null:
			print(data)
		else:
			print("Data is null")

func _on_storage_set_completed(success):
	print("On Storage Set Completed, success: ", success)
