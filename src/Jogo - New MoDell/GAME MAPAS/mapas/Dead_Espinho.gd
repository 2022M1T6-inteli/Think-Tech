extends Area2D

func _on_Dead_Espinho_body_entered(body):
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	Checkpoint.packed_scene = load("res://my_scene.tscn")
	var my_scene = Checkpoint.packed_scene.instance()
	get_tree().change_scene("res://my_scene.tscn") 

