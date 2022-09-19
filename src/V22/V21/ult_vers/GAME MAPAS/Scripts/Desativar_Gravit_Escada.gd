extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "Dog":
		get_node("../Dog").ladder_on = true


func _on_Area2D_body_exited(body):
	if body.name == "Dog":
		get_node("../Dog").ladder_on = false
	
func _ready():
	Global.fruits=0
	Global.keyh=0

func _on_Dead_Espinho_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa1.tscn")
