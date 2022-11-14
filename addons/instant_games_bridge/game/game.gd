class_name InstantGamesBridgeGame
extends Reference

signal visibility_state_changed(state)

var _interface: JavaScriptObject

var _visibility_state_changed_cb = JavaScript.create_callback(self, "_visibility_state_changed")


func _init(interface: JavaScriptObject) -> void:
	_interface = interface

	_interface.on('visibility_state_changed', _visibility_state_changed_cb)


func _visibility_state_changed(args) -> void:
	emit_signal("visibility_state_changed", str(args[0]))