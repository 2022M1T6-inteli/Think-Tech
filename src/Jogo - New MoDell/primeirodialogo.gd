extends Node2D

onready var _pause_menu = $InterfaceLayer/PauseMenu # A variável está recebendo a cena do menu de pausa


func _ready():
	
	# Início da mecânica de checkpoint
	Checkpoint.packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", Checkpoint.packed_scene) # Checkpoint salva a cena primeirodialogo
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	Checkpoint.dimension=0
	
	# Inicia a música do primeiro diálogo
	MusicGlobal.play_music2()
	
	$Area2D/prison.hide() # Oculta a prisão
	
	
	connect("body_entered", self, '_on_NPC_body_entered') # connect necesário para o uso do dialogic
	connect("body_exited", self, '_on_NPC_body_exited') # connect necesário para o uso do dialogic





#Ao iniciar a cena primeirodialogo, o player receberá as primeiras instruções sobre a movimentação
# Início da primeira instrução na fase tutorial
func _on_instrucao1_body_entered(body):
	
	get_tree().paused = true # Pausa o jogo
	
	if Global.lang==1:
		var dialog = Dialogic.start("Instrucao1_eng") # A variável recebe a timeline Instrução1
	
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
		dialog.connect('timeline_end', self, 'continua1') # # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
		add_child(dialog) 

	if Global.lang==2:
		var dialog = Dialogic.start("Instrucao1_port") # A variável recebe a timeline Instrução1
	
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
		dialog.connect('timeline_end', self, 'port_continua1') # # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
		add_child(dialog) 

func continua1(timeline_Instrucao1_eng):
	get_tree().paused = false # Despausa o jogo
	$instrucao1/CollisionShape2D.disabled = true # Desativa a colisão da area2d (a que ativa a primeira instrução)

func port_continua1(timeline_Instrucao1_port):
	get_tree().paused = false # Despausa o jogo
	$instrucao1/CollisionShape2D.disabled = true # Desativa a colisão da area2d (a que ativa a primeira instrução)


# Início do diálogo que vai para a cena do combate
func _on_Area2D2_body_entered(body):

	if body.name == "Player": # Identifica que o player entrou
		get_tree().paused = true # Pausa a tela

		if Global.lang==1:
			var dialog = Dialogic.start("eng_dialogcombat") # A variável recebe a timeline do dialogocombate

			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
			dialog.connect('timeline_end', self, 'notpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

		if Global.lang==2:
			var dialog = Dialogic.start("port_dialogcombat") # A variável recebe a timeline do dialogocombate

			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
			dialog.connect('timeline_end', self, 'port_notpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

# Fim do diálogo que vai para a cena do combate
func notpause(timeline_eng_dialogcombate):
	$Area2D2/CollisionShape2D.disabled=true # Desativa a colisão area2d (a que ativa o diálogo)
	$StaticBody2D.hide() # Oculta a grade que bloqueia o caminho
	$StaticBody2D/CollisionShape2D.disabled=true # Desativa a colisão da grade

	get_tree().paused = false # Despausa o jogo

	#Checkpoint é chamado, pois o player vai para o combate e quando ele volta, tem que voltar para a cena e posição em que estava quando foi para a cena de combate 
	Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2) # Salva a cena
	Checkpoint.coinsSaved=Checkpoint.coinsCollected
	#Chama a cena de combate
	get_tree().change_scene("res://src2/Battle.tscn") 

# Fim do diálogo que vai para a cena do combate
func port_notpause(timeline_port_dialogcombate):
	$Area2D2/CollisionShape2D.disabled=true # Desativa a colisão area2d (a que ativa o diálogo)
	$StaticBody2D.hide() # Oculta a grade que bloqueia o caminho
	$StaticBody2D/CollisionShape2D.disabled=true # Desativa a colisão da grade

	get_tree().paused = false # Despausa o jogo

	#Checkpoint é chamado, pois o player vai para o combate e quando ele volta, tem que voltar para a cena e posição em que estava quando foi para a cena de combate 
	Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2) # Salva a cena
	Checkpoint.coinsSaved=Checkpoint.coinsCollected
	#Chama a cena de combate
	get_tree().change_scene("res://src2/Battle.tscn") 


# Início do diálogo com o Adoy
func _on_Area2D_body_entered(body):

	if body.name == "Player": # Identifica que o player entrou
		get_tree().paused = true # Pausa a tela
		$Area2D/prison.show() # A prisão fica visível 

		if Global.lang==1:
			var dialog = Dialogic.start("eng_adoy1") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'unpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

		if Global.lang==2:
			var dialog = Dialogic.start("port_adoy1") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'port_unpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

func unpause(timeline_eng_adoy1):
	get_tree().paused = false # Despausa o jogo
	
	yield(get_tree().create_timer(0.3), "timeout") 
	
	Checkpoint.coinsSaved=Checkpoint.coinsCollected # Checkpoint é chamado
	
	get_tree().change_scene("res://Mapamundi/mapaMundi.tscn") # Chama a cena da constelação
	
	MusicGlobal.stop_music() # Para a música

func port_unpause(timeline_port_adoy1):
	get_tree().paused = false # Despausa o jogo
	
	yield(get_tree().create_timer(0.3), "timeout") 
	
	Checkpoint.coinsSaved=Checkpoint.coinsCollected # Checkpoint é chamado
	
	get_tree().change_scene("res://Mapamundi/mapaMundi.tscn") # Chama a cena da constelação
	
	MusicGlobal.stop_music() # Para a música




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





# Caso o player morra nos espinhos da fase tutorial, a cena é recarregada
func _on_morte_body_entered(body):
	Checkpoint.packed_scene2 = load("res://my_scene2.tscn")
	var my_scene = Checkpoint.packed_scene2.instance()
	get_tree().change_scene("res://my_scene2.tscn") 



func _on_check1_body_entered(body):
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)


func _on_instrucao_bau_body_entered(body):
	
	if body.name == "Player": # Identifica que o player entrou
		get_tree().paused = true # Pausa a tela

		if Global.lang==1:
			var dialog = Dialogic.start("bau_eng") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'npause_eng') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

		if Global.lang==2:
			var dialog = Dialogic.start("bau_port") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'npause_port') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

func npause_eng(timeline_bau_eng):
	get_tree().paused = false # Despausa o jogo
	$instrucao_bau/CollisionShape2D.disabled=true

func npause_port(timeline_bau_port):
	get_tree().paused = false # Despausa o jogo
	$instrucao_bau/CollisionShape2D.disabled=true


func _on_red_body_entered(body):
	if body.name == "Player": # Identifica que o player entrou
		if Global.lang==1:
			var dialog = Dialogic.start("red_eng") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'nred_eng') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

		if Global.lang==2:
			var dialog = Dialogic.start("red_port") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'nred_port') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog
