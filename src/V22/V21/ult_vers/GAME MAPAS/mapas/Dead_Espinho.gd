extends Area2D

func _ready():
	Global.fruits=0
	Global.keyh=0


func _on_Dead_Espinho_body_entered(body):
	var packed_scene = load("res://my_scene.tscn")
# Instance the scene
	var my_scene = packed_scene.instance()
	get_tree().change_scene("res://my_scene.tscn") 


