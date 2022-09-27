extends Control


func _ready():
	pass 

func _on_Area2D_body_entered(body):
	yield(get_tree().create_timer(0.5), "timeout") # Após 5 segundos, o mapa1 é chamado
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa1.tscn") # mapa1 sendo chamado
