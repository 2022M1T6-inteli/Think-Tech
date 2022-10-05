extends Area2D

func _ready():
	Checkpoint.coinsCollected=Checkpoint.coinsSaved
	Checkpoint.dimension=3
	if !MusicGlobal.is_playing:
		MusicGlobal.play_music5()
	Checkpoint.packed_scene.pack(get_tree().get_current_scene()) # Checkpoint chamado para salvar a cena mapa1 assim que o player entra
	ResourceSaver.save("res://my_scene.tscn", Checkpoint.packed_scene)
"""
func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://mapas/mapa3.tscn")
"""
