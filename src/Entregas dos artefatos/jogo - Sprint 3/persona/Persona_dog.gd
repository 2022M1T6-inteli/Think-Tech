extends KinematicBody2D

var velocidade = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = 3
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -3
	else:
		velocidade.x = 0
	if Input.is_action_pressed("ui_up"):
		velocidade.y = -3
	elif Input.is_action_pressed("ui_down"):
		velocidade.y = 3
	else:
		velocidade.y = 0
		
	move_and_collide(velocidade)
