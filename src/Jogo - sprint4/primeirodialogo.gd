extends Node2D

onready var _pause_menu = $InterfaceLayer/PauseMenu


# inicio do processo de dialog
var active = false


func _ready():
	Checkpoint.packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", Checkpoint.packed_scene)
	Checkpoint.coinsSaved=0
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	if !MusicGlobal.is_playing:
		MusicGlobal.play_music2()
	$Area2D/prison.hide() #oculta a prisao
	
	
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')

func _on_NPC_body_entered(body):
	if body.name == "Player":
		active = true
# dialog inicio



func _on_Area2D2_body_entered(body):
	

	if body.name == "Player":
		get_tree().paused = true # pausa a tela
		
		var dialog = Dialogic.start("dialogocombate")

		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'notpause')
		add_child(dialog) 
		
		

func notpause(timeline_dialogocombate):
	$Area2D2/CollisionShape2D.disabled=true
	$StaticBody2D.hide()
	$StaticBody2D/CollisionShape2D.disabled=true
	$computador.hide()
	get_tree().paused = false # despausa o jogo
	
	
	Checkpoint.packed_scene2.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene2.tscn", Checkpoint.packed_scene2)
	
	
	#depois disso, abre a tela de combate, mas não temos o checkpoint, portanto não dá para colocar
	get_tree().change_scene("res://src2/Battle.tscn") 

	


# Quando comeca o dialogo
func _on_Area2D_body_entered(body):
	
	
	
	if body.name == "Player":
		get_tree().paused = true # pausa a tela
		$Area2D/prison.show()
		
		var dialog = Dialogic.start("Primeirodialogo")
	
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog) 
		
# Quando termina o dialogo
func unpause(timeline_Primeirodialogo):
	get_tree().paused = false # despausa o jogo
	yield(get_tree().create_timer(0.3), "timeout")
	Checkpoint.coinsSaved=Checkpoint.coinsCollected
	get_tree().change_scene("res://Mapamundi/mapaMundi.tscn")
	MusicGlobal.stop_music()




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


#Ao iniciar a cena primeirodialogo, o player receberá as primeiras instruções sobre a movimentação
func _on_instrucao1_body_entered(body):
	get_tree().paused = true #pausa o jogo
	var dialog = Dialogic.start("Instrucao1")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'continua1')
	add_child(dialog) 

func continua1(timeline_Instrucao1):
	get_tree().paused = false # despausa o jogo
	$instrucao1/CollisionShape2D.disabled = true

"""
#Ao entrar nessa area, o player irá receber instruções sobre os cards
func _on_instrucao2_body_entered(body):
	get_tree().paused = true #pausa o jogo
	
	var dialog = Dialogic.start("Instrucao2")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'continua2')
	add_child(dialog) 
	
func continua2(timeline_Instrucao2):
	get_tree().paused = false # despausa o jogo
	$instrucao2/CollisionShape2D.disabled = true
"""



func _on_morte_body_entered(body):
	get_tree().change_scene("res://primeirodialogo.tscn")
