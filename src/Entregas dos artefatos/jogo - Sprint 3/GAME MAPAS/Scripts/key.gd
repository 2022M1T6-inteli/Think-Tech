extends Area2D

var keyh = 1

func _physics_process(delta):
	$Sprite/AnimationPlayer.play("animationkey")






func _on_key_body_entered(body):
	if body.is_in_group("Player_"):
		body.key = true
		print("tudo certo")
		Global.keyh += keyh
		print(Global.keyh)
		queue_free()
