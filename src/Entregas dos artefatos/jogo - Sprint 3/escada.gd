extends Area2D




func _on_escada_body_entered(body):
	if body.is_in_group("Climber"):
		if body.climbing == false:
			body.climbing = true

	
	if Input.is_action_pressed("ui_up"):
		velocidade.x -= speed

	if Input.is_action_pressed("ui_down"):
		velocidade.x += speed
	

func _on_escada_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing == true:
			body.climbing = false
