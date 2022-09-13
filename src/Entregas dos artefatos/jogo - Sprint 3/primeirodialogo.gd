extends Node2D

var ent_comb = 0 #pra saber se entrou na tela de combate
var is_menu=0
onready var _pause_menu = $InterfaceLayer/PauseMenu


# inicio do processo de dialog
var active = false


"""
func _process(delta):
	if Input.is_action_just_pressed("open_menu") and $InterfaceLayer/PauseMenu.visible==false:
		$InterfaceLayer/PauseMenu.show()
		
		#get_tree().paused = true #pausa o jogo
		
		
		
	elif Input.is_action_just_pressed("open_menu") and $InterfaceLayer/PauseMenu.visible==true:
		$InterfaceLayer/PauseMenu.hide()
	"""


func _ready():
	
	$Area2D/prison.hide() #oculta a prisao
	
	if Checkpoint.check==1: #checkpoint para quando o player for pra batalha, conseguir voltar para onde estava
		$Area2D2/CollisionShape2D.disabled = true 
		$StaticBody2D/Sprite.hide() #esconde a porta sprite
		$StaticBody2D/CollisionShape2D.disabled = true #colision #faz a colisão da porta sumir
		
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
	get_tree().paused = false # despausa o jogo

	#depois disso, abre a tela de combate, mas não temos o checkpoint, portanto não dá para colocar
	get_tree().change_scene("res://src2/Battle.tscn") 
	Checkpoint.check=1
	


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
	Checkpoint.check=2
	get_tree().paused = false # despausa o jogo
	get_tree().change_scene("res://transicao.tscn")




"""
func _on_ResumeButton_pressed():
	$InterfaceLayer/PauseMenu.hide()
	#get_tree().paused = false 


func _on_QuitButton_pressed():
	get_tree().quit()
"""



func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()
	# The GlobalControls node, in the Stage scene, is set to process even
	# when the game is paused, so this code keeps running.
	# To see that, select GlobalControls, and scroll down to the Pause category
	# in the inspector.
	elif event.is_action_pressed("toggle_pause"):
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()


func _on_sound_body_entered(body):
	$Alarme.play()#ver com a celine
