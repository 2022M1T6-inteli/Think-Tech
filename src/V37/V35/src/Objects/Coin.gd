class_name Coin
extends Area2D
# Colecionável que desaparece quando o jogador o toca.

onready var animation_player = $AnimationPlayer

# As Moedas só detectam colisões com o Jogador graças à sua máscara de colisão.
# Isso evita que outros personagens, como inimigos, peguem moedas.

# Quando o jogador colide com uma moeda, a moeda reproduz sua animação de "escolhido".
# A animação se encarrega de fazer a moeda desaparecer, mas também desativa sua
# colisões e o libera da memória, evitando que escrevamos códigos mais complexos.
# Clique no nó AnimationPlayer para ver a linha do tempo da animação.
func _on_body_entered(_body):
	animation_player.play("picked")
	Checkpoint.coinsCollected+=1
