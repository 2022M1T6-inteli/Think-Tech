extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta:float):
	text = "00" + String(Global.fruits)
	if Global.fruits >= 10:
		text = "0" + String(Global.fruits)
