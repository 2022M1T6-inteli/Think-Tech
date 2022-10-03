extends Control


func _ready():
	pass 

func _on_Tutorial_pressed(): # Botão para o tutorial
	get_tree().change_scene("res://Mapamundi/0-transiçao.tscn") # Chama a cena do tutorial


func _on_Fase1_pressed(): # Botão para mapa1
	get_tree().change_scene("res://Mapamundi/mapaMundi.tscn") # Chama o mapa 1


func _on_Fase2_pressed(): # Botão para mapa2
	get_tree().change_scene("res://Mapamundi/2-Transiçao.tscn") # Chama o mapa 2


func _on_Fase3_pressed(): # Botão para mapa3
	get_tree().change_scene("res://Mapamundi/3-Transiçao.tscn") # Chama o mapa 3


func _on_Fase4_pressed(): # Botão para mapa4
	get_tree().change_scene("res://Mapamundi/4-Transiçao.tscn") # Chama o mapa 4, mas ainda não está implementadado, então o foguete chega nele, mas não chama nenhum mapa


func _on_voltarMenu_pressed(): # Voltar para o menu
	get_tree().change_scene("res://startScreen.tscn")
