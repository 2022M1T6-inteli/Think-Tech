extends Node

onready var _pause_menu = $InterfaceLayer/PauseMenu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !MusicGlobal.is_playing:
		MusicGlobal.play_music5()


func _on_morte_body_entered(body):
	get_tree().change_scene("res://GAME MAPAS/mapas/mapa3.tscn")


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
