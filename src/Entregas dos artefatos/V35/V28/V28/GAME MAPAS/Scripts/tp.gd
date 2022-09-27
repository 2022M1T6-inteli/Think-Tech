extends Area2D

export(String, FILE, "*.tscn") var cenas


func _on_Area2D2_body_entered(body):
	get_tree().change_scene(cenas)
