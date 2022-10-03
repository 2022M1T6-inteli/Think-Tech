extends Area2D



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Mapamundi/3-Transiçao.tscn")
	MusicGlobal.stop_music()
