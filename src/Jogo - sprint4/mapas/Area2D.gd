extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "DOG":
		get_node("../DOG").ladder_on = true


func _on_Area2D_body_exited(body):
	if body.name == "DOG":
		get_node("../DOG").ladder_on = false
