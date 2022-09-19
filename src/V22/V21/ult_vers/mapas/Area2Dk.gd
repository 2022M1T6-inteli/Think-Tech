extends Area2D




func _on_Area2D2_body_entered(_body):
	get_tree().change_scene("res://mapas/mapa1.tscn")
