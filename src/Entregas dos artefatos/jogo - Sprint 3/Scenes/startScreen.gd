extends Control

func _ready():
	pass

#  Inicia o jogo.	
func _on_startBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Video.tscn")


# Mostra os controles do jogo.	
func _on_controlBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Control.tscn")


# Fecha o jogo.
func _on_quitBtn_pressed() -> void:
	get_tree().quit()
