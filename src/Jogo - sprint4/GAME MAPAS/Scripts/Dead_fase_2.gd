extends Area2D


func _on_Dead_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa2.tscn")
