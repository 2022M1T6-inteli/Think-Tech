extends Area2D

func _on_saida_mundo1_body_entered(body):
	get_tree().change_scene("res://Mapamundi/2-Transiçao.tscn")
	MusicGlobal.stop_music()
	
