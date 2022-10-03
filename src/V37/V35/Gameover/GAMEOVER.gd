extends ColorRect

func _ready():
	MusicGlobal.stop_music()
func _on_Quit_pressed():
	get_tree().change_scene("res://startScreen.tscn")


func _on_Continue_pressed():
	Checkpoint.packed_scene = load("res://my_scene.tscn")
	var my_scene = Checkpoint.packed_scene.instance()
	get_tree().change_scene("res://my_scene.tscn")
