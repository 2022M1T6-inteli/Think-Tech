extends Node2D

onready var _pause_menu = $InterfaceLayer/PauseMenu # A variável está recebendo a cena do menu de pausa


func _ready():
	Checkpoint.coinsCollected=Checkpoint.coinsSaved # Checkpoint chamado para salvar a quantidade de moedas que o player já coletou na fase anterior
	
	if !MusicGlobal.is_playing: # A música do mapa1 começa a tocar
		MusicGlobal.play_music3()

	Checkpoint.packed_scene.pack(get_tree().get_current_scene()) # Checkpoint chamado para salvar a cena mapa1 assim que o player entra
	ResourceSaver.save("res://my_scene.tscn", Checkpoint.packed_scene)



# Enemy 1
func _on_Area2D1_body_entered(body): # Area2D do enemy1
	if body.name == "Player": # identifica que o player entrou
		Checkpoint.coinsSaved=Checkpoint.coinsCollected # Salva a quantidade de moedas que o player coletou
		$Enemy/Area2D1/CollisionShape2D.disabled=true # Desabilita a colisão da Area2D do enemy1

# Checkpoint chamado para salvar a cena antes do player ir para a cena do combate
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
	
		get_tree().change_scene("res://src2/Battle.tscn") # Chama a cena do combate



# Enemy2
func _on_Area2D2_body_entered(body):
	if body.name == "Player": # Identifica que o player entrou na Area2d
		Checkpoint.coinsSaved=Checkpoint.coinsCollected # Salva a quantidade de moedas que o player já comentou
		$Enemy2/Area2D2/CollisionShape2D.disabled=true # Desabilita a colisão da Area2D do enemy2

# Checkpoint chamado para salvar a cena antes do player ir para a cena do combate
		var packed_scene = PackedScene.new()
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn") # Chama a cena do combate
	
	


# Enemy 3
func _on_Area2D3_body_entered(body):

	if body.name == "Player": # Identifica que o player entrou
		Checkpoint.coinsSaved=Checkpoint.coinsCollected # Salva a quantidade de moedas
		$Enemy3/Area2D3/CollisionShape2D.disabled=true # Desabilita a colisão da Area2d do enemy3

# Checkpoint chamado para salvar a cena antes do player ir para a cena do combate
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn") # Chama a cena do combate



# Enemy 4
func _on_Area2D4_body_entered(body):
	if body.name == "Player": # Identifica que o player entrou na Area2D
		Checkpoint.coinsSaved=Checkpoint.coinsCollected # Salva a quantidade de moedas já coletadas
		$Enemy4/Area2D4/CollisionShape2D.disabled=true # Desabilita a colisão da Area2D do enemy4

# Checkpoint chamado para salvar a cena antes do player ir para a cena do combate
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn") # Chama a cena do combate

# Enemy 5
func _on_Area2D5_body_entered(body):
	if body.name == "Player": # Identifica que o player entrou na Area2D
		Checkpoint.coinsSaved=Checkpoint.coinsCollected # Salva a quantidade de moedas já coletadas
		$Enemy5/Area2D5/CollisionShape2D.disabled=true # Desabilita a colisão da Area2D do enemy5

# Checkpoint chamado para salvar a cena antes do player ir para a cena do combate
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn") # Chama a cena do combate
		

"""
func _on_key_body_entered(body):
	$Key_sound.play() 
"""


func _unhandled_input(event): # Aqui programamos as funções de duas teclas definidas no mapa de entradas
	if event.is_action_pressed("toggle_fullscreen"): # Ao apertar F11 (toggle_fullscreen), a tela fica em modo fullscreen
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()

	elif event.is_action_pressed("toggle_pause"): # Ao apertar ESC (toggle_pause), o menu pause aparece
		print()
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()
