extends KinematicBody2D

var velocidade = Vector2.ZERO
var forca = Vector2.ZERO


const MAX = 120
const ACELERACAO = 250
const ATRITO = 80

onready var animacao = $AnimationPlayer
onready var animacaoprin = $AnimationTree
onready var animacaoestado = animacaoprin.get("parameters/playback")

func _physics_process(delta):

	forca.x = Input.get_action_strength("Direita") - Input.get_action_strength("Esquerda")
	forca.y = Input.get_action_strength("Baixo") - Input.get_action_strength("Cima")
	forca = forca.normalized()
	
	if forca != Vector2.ZERO:
		animacaoprin.set("parameters/BlendSpace2D/blend_position", forca)
		animacaoprin.set("parameters/parado/blend_position", forca)
		
		velocidade = velocidade.move_toward(forca * MAX, ACELERACAO *delta)
		
		animacaoestado.travel("BlendSpace2D")
	
	else:
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
		animacaoestado.travel("parado")
		
	move_and_slide(velocidade)
	
