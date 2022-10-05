extends Node

onready var _pause_menu = $InterfaceLayer/PauseMenu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Checkpoint.dimension=3
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	Checkpoint.packed_scene.pack(get_tree().get_current_scene()) # Checkpoint chamado para salvar a cena mapa1 assim que o player entra
	ResourceSaver.save("res://my_scene.tscn", Checkpoint.packed_scene)
	if !MusicGlobal.is_playing:
		MusicGlobal.play_music5()


func _on_morte_body_entered(body):
	get_tree().change_scene("res://my_scene.tscn")


func _on_key_body_entered(body):
	$Key_Sound.play()
	
	
	
	
func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()
	# The GlobalControls node, in the Stage scene, is set to process even
	# when the game is paused, so this code keeps running.
	# To see that, select GlobalControls, and scroll down to the Pause category
	# in the inspector.
	elif event.is_action_pressed("toggle_pause"):
		print()
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()


func _on_Instrucao_body_entered(body):
	get_tree().paused = true # Pausa o jogo
	
	
	if Global.lang==1:
		var dialog = Dialogic.start("map3_eng") # A variável recebe a timeline Instrução1

		dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
		dialog.connect('timeline_end', self, 'continua5') # # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
		add_child(dialog) 

	if Global.lang==2:
		var dialog = Dialogic.start("map3_port") # A variável recebe a timeline Instrução1

		dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Pausado ou não, este nó será processado.
		dialog.connect('timeline_end', self, 'continua5_port') # # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
		add_child(dialog) 


func continua5(timeline_map3_eng):
	get_tree().paused = false # Despausa o jogo
	$Instrucao/CollisionShape2D.disabled = true # Desativa a colisão da area2d (a que ativa a instrução)

func continua5_port(timeline_map3_port):
	get_tree().paused = false # Despausa o jogo
	$Instrucao/CollisionShape2D.disabled = true # Desativa a colisão da area2d (a que ativa a instrução)


func _on_Area2D1_body_entered(body):
	if body.name == "Player":
		Checkpoint.coinsSaved=Checkpoint.coinsCollected
		$Enemy/Area2D1/CollisionShape2D.disabled=true
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn")


func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		Checkpoint.coinsSaved=Checkpoint.coinsCollected
		$Enemy2/Area2D2/CollisionShape2D.disabled=true
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn")


func _on_Area2D3_body_entered(body):
	if body.name == "Player":
		Checkpoint.coinsSaved=Checkpoint.coinsCollected
		$Enemy3/Area2D3/CollisionShape2D.disabled=true
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn")


func _on_Area2D4_body_entered(body):
	if body.name == "Player":
		Checkpoint.coinsSaved=Checkpoint.coinsCollected
		$Enemy4/Area2D4/CollisionShape2D.disabled=true
		Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
		get_tree().change_scene("res://src2/Battle.tscn")


func _on_Ada_body_entered(body):

	if body.name == "Player": # Identifica que o player entrou
		get_tree().paused = true # Pausa a tela

		if Global.lang==1:
			var dialog = Dialogic.start("ada_eng") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'unpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

		if Global.lang==2:
			var dialog = Dialogic.start("ada_port") # A variável recebe a timeline Primeirodialogo
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS # Ao fazer isso, mesmo com o get_tree().paused ativado, o plugin dialogic funcioná
			dialog.connect('timeline_end', self, 'port_unpause') # Conecta o fim do diálogo com uma função que dará instruções sobre o que fazer quando esse diálogo acabar
			add_child(dialog) # Adiciona um nó chamado dialog

func unpause(timeline_ada_eng):
	get_tree().paused = false # Despausa o jogo
	
	yield(get_tree().create_timer(0.3), "timeout") 
	
	Checkpoint.coinsSaved=Checkpoint.coinsCollected # Checkpoint é chamado
	
	#get_tree().change_scene(tela de creditos) # Chama a cena da constelação
	


func port_unpause(timeline_ada_port):
	get_tree().paused = false # Despausa o jogo
	
	yield(get_tree().create_timer(0.3), "timeout") 
	
	Checkpoint.coinsSaved=Checkpoint.coinsCollected # Checkpoint é chamado
	
	#get_tree().change_scene(tela de creditos) # Chama a cena da constelação
