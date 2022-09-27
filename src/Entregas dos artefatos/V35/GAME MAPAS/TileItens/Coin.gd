extends Area2D

var fruits = 1
func _process(delta):
	$AnimationPlayer.play("CoinMoved")


func _on_coin_body_entered(body):
	Global.fruits += fruits
	print(Global.fruits)
	queue_free()
