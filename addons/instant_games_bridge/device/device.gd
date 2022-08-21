class_name InstantGamesBridgeDevice
extends Reference

var _interface: JavaScriptObject


func _init(interface: JavaScriptObject) -> void:
	_interface = interface


var type: String setget , _type_getter
func _type_getter() -> String:
	return _interface.type if _interface != null else DeviceType.DESKTOP
