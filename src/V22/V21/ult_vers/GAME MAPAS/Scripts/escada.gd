extends Area2D


func _on_escadas_body_entered(body):
	if body.name == "Dog":
		get_node("../Dog").ladder_on = true


func _on_escadas_body_exited(body):
	if body.name == "Dog":
		get_node("../Dog").ladder_on = false
