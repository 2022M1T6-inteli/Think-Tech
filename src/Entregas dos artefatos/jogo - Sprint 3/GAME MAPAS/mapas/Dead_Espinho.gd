extends Area2D

func _ready():
	Global.fruits=0
	Global.keyh=0


func _on_Dead_Espinho_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa1.tscn")

