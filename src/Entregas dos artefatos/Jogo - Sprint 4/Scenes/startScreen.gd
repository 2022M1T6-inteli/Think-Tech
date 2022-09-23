extends Control

#var volume = 
# Inicia a Musica checando se a musica está tocando, se não estiver tocando ela toca a função play_music
func _process(delta):
	if Global.lang==1:
		$startBtn.text="Start"
		$Mapas.text="Maps"
		$controlBtn.text="Options"
		$quitBtn.text="Quit"
		$langBtn.text="Eng"
	else:
		$startBtn.text="Começar"
		$Mapas.text="Mapas"
		$controlBtn.text="Opções"
		$quitBtn.text="Sair"
		$langBtn.text="PT-BR"
func _ready():
	if !MusicGlobal.is_playing: #Inicia a música
		MusicGlobal.play_music()

#  Inicia o jogo.	
func _on_startBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Video.tscn")
	MusicGlobal.stop_music() # Para a música
	


# Abre a tela de opções do jogo	
func _on_controlBtn_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Control.tscn")
	


# Fecha o jogo.
func _on_quitBtn_pressed() -> void:
	get_tree().quit()

# Abre a tela da constelação e mostra todos os planetas
func _on_Mapas_pressed():
	get_tree().change_scene("res://Scenes/TeladosMapas.tscn")

# Troca o idioma
func _on_langBtn_pressed():
	if Global.lang==1:
		Global.lang=2
	else:
		Global.lang=1
