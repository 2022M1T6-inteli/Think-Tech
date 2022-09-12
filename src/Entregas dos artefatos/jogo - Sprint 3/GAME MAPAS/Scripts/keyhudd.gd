extends Label


func _process(delta:float):
	text = "0" + String(Global.keyh)
	if Global.fruits >= 10:
		text =String(Global.keyh)
