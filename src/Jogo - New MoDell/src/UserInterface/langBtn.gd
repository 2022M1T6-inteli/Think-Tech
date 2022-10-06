extends Button


func _on_langBtn_pressed():
	if Global.lang==1:
		Global.lang=2
	else:
		Global.lang=1
