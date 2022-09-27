extends KinematicBody2D



var speed = 100
var jump_speed = -250
var gravidade = 1000
var velocidade = Vector2.ZERO
var jump_count = 0
onready var animacao = $AnimationPlayer
var ladder_on = false

func move():
	velocidade.x = 0
	
	if Input.is_action_pressed("ui_left"):
		velocidade.x -= speed

	if Input.is_action_pressed("ui_right"):
		velocidade.x += speed

func jump():
	if Input.is_action_just_pressed("jump") and jump_count < 1:
		velocidade.y = jump_speed
		jump_count += 1
		
	if is_on_floor():
		jump_count = 0


func animate(motion):
	if motion.x == 0:
		animacao.play("idle")
	if motion.x > 0 and is_on_floor():
		animacao.play("direita")
	elif motion.x < 0 and is_on_floor():
		animacao.play("esquerda")
	elif motion.y != 0 and not is_on_floor() and motion.x > 0:
		animacao.play('pulod')
	elif motion.y != 0 and not is_on_floor() and motion.x < 0:
		animacao.play("puloe")
	elif motion.x == 0 and motion.y != 0:
		animacao.play("idle")

func escada():
	if ladder_on == true:
		gravidade = 0
		if Input.is_action_pressed("ui_up"):
			velocidade.y = -speed
			animacao.play("escada")
			
		elif Input.is_action_pressed("ui_down"):
			velocidade.y = speed
			animacao.play("escada")
		
		else:
			velocidade.y = 0
			
			
	else:
		gravidade = 700
		
func _physics_process(delta):
	move()
	velocidade.y += gravidade * delta
	#print(ladder_on)
	velocidade = move_and_slide(velocidade, Vector2.UP)
	animate(velocidade)
	escada()
	jump()

