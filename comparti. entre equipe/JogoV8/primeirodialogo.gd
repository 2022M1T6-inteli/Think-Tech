extends Node2D

var ent_comb = 0 #pra saber se entrou na tela de combate

# inicio do processo de dialog
var active = false

func _ready():
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


		#CHECKPOINT INICIO
		


		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'notpause')
		add_child(dialog) 

func notpause(timeline_dialogocombate):
	get_tree().paused = false # despausa o jogo

	#depois disso, abre a tela de combate, mas não temos o checkpoint, portanto não dá para colocar
	#get_tree().change_scene("res://src2/Battle.tscn") 
	
	$Area2D2/CollisionShape2D.disabled = true
	
	ent_comb = 1
	

#Quando retornar para essa tela, a porta precisa sumir
	if(ent_comb==1):
		$StaticBody2D/Sprite.hide() #porta sprite
		$StaticBody2D/CollisionShape2D.disabled = true #colision

# Quando comeca o dialogo
func _on_Area2D_body_entered(body):
	
	if body.name == "Player":
		get_tree().paused = true # pausa a tela
		
		var dialog = Dialogic.start("Primeirodialogo")
	
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog) 
		
# Quando termina o dialogo
func unpause(timeline_Primeirodialogo):
	get_tree().paused = false # despausa o jogo
	get_tree().change_scene("res://transicao.tscn")


