extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _ready():
	if Global.lang==1:
		$ColorRect/Label.text = "To skip, press:"
	if Global.lang==2:
		$ColorRect/Label.text = "Para pular, pressione:"
	
	$ColorRect.show()
	if !MusicGlobal.is_playing: # A música do mapa1 começa a tocar
		MusicGlobal.play_music0()

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Mapamundi/0-transiçao.tscn")


func _unhandled_input(event):
	if event.is_action_pressed("skip"):
		get_tree().change_scene("res://Mapamundi/0-transiçao.tscn")


func _on_Timer_timeout():
	$ColorRect.hide()
