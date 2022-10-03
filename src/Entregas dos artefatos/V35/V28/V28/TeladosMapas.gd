extends Control


func _ready():
	pass 

func _on_Tutorial_pressed():
	get_tree().change_scene("res://Mapamundi/0-transiçao.tscn")


func _on_Fase1_pressed():
	get_tree().change_scene("res://Mapamundi/mapaMundi.tscn")


func _on_Fase2_pressed():
	get_tree().change_scene("res://Mapamundi/2-Transiçao.tscn")


func _on_Fase3_pressed():
	get_tree().change_scene("res://Mapamundi/3-Transiçao.tscn")


func _on_Fase4_pressed():
	get_tree().change_scene("res://Mapamundi/4-Transiçao.tscn")
