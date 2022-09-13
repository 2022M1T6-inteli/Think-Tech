extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fundo_sound.play()
	Global.fruits=0
	Global.keyh=0


func _on_morte_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa3.tscn")
