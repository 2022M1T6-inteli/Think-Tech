extends ColorRect





func _on_Quit_pressed():
	get_tree().quit()


func _on_Continue_pressed():
	Checkpoint.packed_scene = load("res://my_scene.tscn")
	var my_scene = Checkpoint.packed_scene.instance()
	get_tree().change_scene("res://my_scene.tscn")
