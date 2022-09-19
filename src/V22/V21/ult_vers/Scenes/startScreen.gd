extends Control

#var volume = 
# Inicia a Musica checando se a musica está tocando, se não estiver tocando ela toca a função play_music
func _ready():
	if !MusicGlobal.is_playing: 
		MusicGlobal.play_music()

#  Inicia o jogo.	
func _on_startBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Video.tscn")
	MusicGlobal.stop_music()
	


# Mostra os controles do jogo.	
func _on_controlBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Control.tscn")
	


# Fecha o jogo.
func _on_quitBtn_pressed() -> void:
	get_tree().quit()
