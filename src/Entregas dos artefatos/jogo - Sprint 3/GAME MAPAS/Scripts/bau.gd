extends Area2D

var player_ref

func _on_bau_body_entered(body):
	if body.is_in_group("Player_"):
		player_ref = body

func _on_bau_body_exited(body):
	if body.is_in_group("Player_"):
		player_ref = null

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Open") and player_ref != null:
		if Global.keyh > 0:
			Global.keyh -=1
			$AnimatedSprite.play("aberto")
			print("ok")
			player_ref.key = false
			
