extends Control


func _ready():
	MusicGlobal.stop_music()

func _on_Area2D_body_entered(body):
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://primeirodialogo.tscn")
