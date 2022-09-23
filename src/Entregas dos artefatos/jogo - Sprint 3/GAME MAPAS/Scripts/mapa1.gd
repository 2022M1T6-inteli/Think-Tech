extends Node2D

func _ready():
	Player.position=Checkpoint.lastPosition
	Checkpoint.lastScene="res://GAME MAPAS/mapas/mapa1.tscn"
func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa3.tscn")
