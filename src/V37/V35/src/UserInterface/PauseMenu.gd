extends Control


export(Vector2) var _start_position = Vector2(0, -20)
export(Vector2) var _end_position = Vector2.ZERO
export(float) var fade_in_duration = 0.3
export(float) var fade_out_duration = 0.2

onready var center_cont = $ColorRect/CenterContainer
onready var resume_button = center_cont.get_node(@"VBoxContainer/ResumeButton")


onready var root = get_tree().get_root()
onready var scene_root = root.get_child(root.get_child_count() - 1)
onready var tween = $Tween

func _process(delta): #Aqui é a sessão de desbloquear os cards
	if Checkpoint.coinsCollected>=5:
		$Cards/card_test.hide()
	
	if Checkpoint.coinsCollected>=10:
		$Cards/bloqueio1.hide()
	
	if Checkpoint.coinsCollected>=15:
		$Cards/bloqueio2.hide()

	if Checkpoint.coinsCollected>=20:
		$Cards/bloqueio3.hide()

	if Checkpoint.coinsCollected>=25:
		$Cards/bloqueio4.hide()

	if Checkpoint.coinsCollected>=30:
		$Cards/bloqueio5.hide()
	
	if Checkpoint.coinsCollected>=35:
		$Cards/bloqueio6.hide()

	if Checkpoint.coinsCollected>=40:
		$Cards/bloqueio7.hide()

	if Checkpoint.coinsCollected>=45:
		$Cards/bloqueio8.hide()

	if Checkpoint.coinsCollected>=50:
		$Cards/bloqueio9.hide()

func close():
	get_tree().paused = false
	# Tween's interpolate_property has these arguments:
	# (Target object, "Property:OptionalSubProperty", From value, To value,
	# Tween duration, Transition type, Easing type, Optional delay)
	tween.interpolate_property(self, "modulate:a", 1.0, 0.0,
			fade_out_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(center_cont, "rect_position",
			_end_position, _start_position, fade_out_duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()


func open():
	show()
	resume_button.grab_focus()

	tween.interpolate_property(self, "modulate:a", 0.0, 1.0,
			fade_in_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(center_cont, "rect_position",
			_start_position, _end_position, fade_in_duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()


func _on_ResumeButton_pressed():
	if not tween.is_active():
		close()


func _on_QuitButton_pressed():
	scene_root.notification(NOTIFICATION_WM_QUIT_REQUEST)
	get_tree().quit()


func _on_Tween_all_completed():
	if modulate.a < 0.5:
		hide()


func _on_CardsButton_pressed():
	$Cards.show()
	
	
func _on_voltarMenu_pressed():
	$Cards.hide()
	
func _on_Roadmap_pressed():
	$Cards.hide()
	$Roadmap.show()


func _on_voltarMenu2_pressed():
	$Cards.show()
	$Roadmap.hide()


func _on_Vision_pressed():
	$Cards.hide()
	$Vision.show()
	
	
func _on_voltarMenu3_pressed():
	$Cards.show()
	$Vision.hide()
	
	
func _on_Business_pressed():
	$Cards.hide()
	$Business.show()


func _on_voltarMenu4_pressed():
	$Cards.show()
	$Business.hide()


func _on_User_pressed():
	$Cards.hide()
	$User.show()


func _on_voltarMenu5_pressed():
	$Cards.show()
	$User.hide()
	

func _on_Backlog_pressed():
	$Cards.hide()
	$Backlog.show()


func _on_voltarMenu6_pressed():
	$Cards.show()
	$Backlog.hide()
	
	
func _on_Stakeholder_pressed():
	$Cards.hide()
	$Stakeholder.show()


func _on_voltarMenu7_pressed():
	$Cards.show()
	$Stakeholder.hide()


func _on_Deployment_pressed():
	$Cards.hide()
	$Deployment.show()
	

func _on_voltarMenu8_pressed():
	$Cards.show()
	$Deployment.hide()


func _on_Quality_pressed():
	$Cards.hide()
	$Quality.show()
	
	
func _on_voltarMenu9_pressed():
	$Cards.show()
	$Quality.hide()


func _on_DataDriven_pressed():
	$Cards.hide()
	$DataDriven.show()


func _on_voltarMenu10_pressed():
	$Cards.show()
	$DataDriven.hide()





func _on_button_explicacao_pressed():
	$Cards.hide()
	$explic_cards.show()

func _on_voltarMenu0_pressed():
	$Cards.show()
	$explic_cards.hide()
