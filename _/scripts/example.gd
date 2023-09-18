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
		if data[0] != null:
			print("level: ", data[0])
		else:
			print("level is null")
			
		if data[1] != null:
			print("is_tutorial_completed: ", data[1])
		else:
			print("is_tutorial_completed is null")
		
		if data[2] != null:
			print("coins: ", data[2])
		else:
			print("coins is null")

func _on_storage_set_completed(success):
	print("On Storage Set Completed, success: ", success)
