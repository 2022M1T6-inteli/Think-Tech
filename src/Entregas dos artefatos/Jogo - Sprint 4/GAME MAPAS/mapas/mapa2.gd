extends Node2D

onready var _pause_menu = $InterfaceLayer/PauseMenu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !MusicGlobal.is_playing:
		MusicGlobal.play_music4()
	


func _on_key_body_entered(body):
	$keySound.play()



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
