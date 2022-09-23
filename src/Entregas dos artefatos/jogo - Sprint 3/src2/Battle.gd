extends Control

signal textbox_closed

export(Resource) var enemy = null

var current_player_health = 0
var current_enemy_health = 0
var is_defending = false
var chosen_alt=0
var question_id
var multi=0
func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()
func _ready():
	set_health($EnemyContainer/ProgressBar, enemy.health, enemy.health)
	set_health($PlayerPanel/PlayerData/ProgressBar, State.current_health, State.max_health)
	$EnemyContainer/Enemy.texture = enemy.texture
	
	current_player_health = State.current_health
	current_enemy_health = enemy.health
	
	$Textbox.hide()
	$ActionsPanel.hide()
	
	display_text("A wild %s appears!" % enemy.name.to_upper())
	yield(self, "textbox_closed")
	$ActionsPanel.show()

func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP: %d/%d" % [health, max_health]

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT)) and $Textbox.visible:
		$Textbox.hide()
		emit_signal("textbox_closed")

func display_text(text):
	$ActionsPanel.hide()
	$Textbox.show()
	$Textbox/Label.text = text

func enemy_turn():
	display_text("%s launches at you fiercely!" % enemy.name)
	yield(self, "textbox_closed")
	
	if is_defending:
		is_defending = false
		$AnimationPlayer.play("mini_shake")
		yield($AnimationPlayer, "animation_finished")
		display_text("You defended successfully!")
		yield(self, "textbox_closed")
	else:
		current_player_health = max(0, current_player_health - enemy.damage)
		set_health($PlayerPanel/PlayerData/ProgressBar, current_player_health, State.max_health)
		$AnimationPlayer.play("shake")
		yield($AnimationPlayer, "animation_finished")
		display_text("%s dealt %d damage!" % [enemy.name, enemy.damage])
		yield(self, "textbox_closed")
	$ActionsPanel.show()

func _on_Run_pressed():
	display_text("Got away safely!")
	yield(self, "textbox_closed")
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().change_scene("res://primeiro dialogo.tscn") 

func Attack():
	
	display_text("You swing your piercing sword!")
	yield(self, "textbox_closed")
	var tdam=State.damage*multi
	
	current_enemy_health = max(0, current_enemy_health - tdam)
	set_health($EnemyContainer/ProgressBar, current_enemy_health, enemy.health)

	$AnimationPlayer.play("enemy_damaged")
	yield($AnimationPlayer, "animation_finished")
	
	display_text("You dealt %d damage!" % tdam)
	yield(self, "textbox_closed")
	
	if current_enemy_health == 0:
		display_text("%s was defeated!" % enemy.name)
		yield(self, "textbox_closed")
		
		$AnimationPlayer.play("enemy_died")
		yield($AnimationPlayer, "animation_finished")
		
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene(Checkpoint.lastScene)

	enemy_turn()

func _on_Defend_pressed():
	is_defending = true
	
	display_text("You prepare defensively!")
	yield(self, "textbox_closed")
	yield(get_tree().create_timer(0.25), "timeout")
	
	enemy_turn()
	
	
	
	
func _on_Precision_pressed():
	$Precision.show()
	randomize()
	question_id=randi()%3
	display_text(Questions.ListaQ[question_id])
	var lista=[Questions.ListaA[question_id][0],Questions.ListaA[question_id][1],Questions.ListaA[question_id][2],Questions.ListaA[question_id][3]]
	var temp=[0,1,2,3]
	var temp3
	var temp2=randi()%(temp.size()-1)
	temp3=temp.pop_at(temp2)
	$Precision/Prec1/Label.text=Questions.ListaA[question_id][temp3]
	
	
	temp2=randi()%(temp.size()-1)
	temp3=temp.pop_at(temp2)
	$Precision/Prec2/Label.text=Questions.ListaA[question_id][temp3]
	
	temp2=randi()%(temp.size()-1)
	temp3=temp.pop_at(temp2)
	$Precision/Prec3/Label.text=Questions.ListaA[question_id][temp3]
	
	temp3=temp[0]
	$Precision/Prec4/Label.text=Questions.ListaA[question_id][temp3]
	




func _on_Prec1_pressed():
	chosen_alt=1
	verificar()

func _on_Prec2_pressed():
	chosen_alt=2
	verificar()

func _on_Prec3_pressed():
	chosen_alt=3
	verificar()

func _on_Prec4_pressed():
	chosen_alt=4
	verificar()
	
	
	
	
func verificar():
	if(chosen_alt==1):
		if($Precision/Prec1/Label.text == Questions.ListaA[question_id][0]):
			multi=1
			$temporario.text = "Vc acertou"
			chosen_alt=0
			$Precision.hide()
			Attack()
			
		else:
			multi=0
			$temporario.text = "Vc errou"
			$Precision.hide()
			Attack()
			
		
	elif (chosen_alt==2):
			if($Precision/Prec2/Label.text == Questions.ListaA[question_id][0]):
				multi=1
				$temporario.text = "Vc acertou"
				chosen_alt=0
				print($temporario)
				$Precision.hide()
				Attack()
				
			else:
				multi=0
				$temporario.text = "Vc errou"
				$Precision.hide()
				Attack()
				
	elif (chosen_alt==3):
			if($Precision/Prec3/Label.text == Questions.ListaA[question_id][0]):
				multi=1
				$temporario.text = "Vc acertou"
				chosen_alt=0
				print($temporario)
				$Precision.hide()
				Attack()
				
			else:
				multi=0
				$temporario.text = "Vc errou"
				$Precision.hide()
				Attack()
				
	elif (chosen_alt==4):
			if($Precision/Prec4/Label.text == Questions.ListaA[question_id][0]):
				multi=1
				$temporario.text = "Vc acertou"
				chosen_alt=0
				print($temporario)
				$Precision.hide()
				Attack()
				
			else:
				multi=0
				$temporario.text = "Vc errou"
				$Precision.hide()
				Attack()
	
	
