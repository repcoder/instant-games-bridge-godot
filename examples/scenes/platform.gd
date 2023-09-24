extends DetailedSceneBase


onready var id_label = $MarginContainer2/VBoxContainer/HBoxContainer/PlatformID
onready var language_label = $MarginContainer2/VBoxContainer/HBoxContainer/Language
onready var payload_label = $MarginContainer2/VBoxContainer/HBoxContainer/Payload
onready var tld_label = $MarginContainer2/VBoxContainer/HBoxContainer/Tld


func _ready():
	id_label.text = "Platform ID: " + Bridge.platform.id
	language_label.text = "Language: " + Bridge.platform.language
	
	if Bridge.platform.payload:
		payload_label.text = "Payload: " + Bridge.platform.payload
	else:
		payload_label.text = "Payload: null"
	
	if Bridge.platform.tld:
		tld_label.text = "TLD: " + Bridge.platform.tld
	else:
		tld_label.text = "TLD: null"


func _on_send_game_ready_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAME_READY)

func _on_send_in_game_loading_started_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.IN_GAME_LOADING_STARTED)

func _on_send_in_game_loading_stopped_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.IN_GAME_LOADING_STOPPED)

func _on_send_gameplay_started_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STARTED)

func _on_send_gameplay_stopped_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.GAMEPLAY_STOPPED)

func _on_send_player_got_achievement_button_pressed():
	Bridge.platform.send_message(Bridge.PlatformMessage.PLAYER_GOT_ACHIEVEMENT)
