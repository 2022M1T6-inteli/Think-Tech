extends Control


func _ready():
	pass


# Retorna para a tela inicial.
func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/startScreen.tscn")
	
