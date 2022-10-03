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
		$AnimatedSprite.play("aberto")
		$Open.play()
		$Area_cafe_large/cafelarge.show()
		$AnimatedSprite.hide()
		player_ref.key = false
		$Collisionbau2.disabled = true
		$Area_cafe_large/CollisionItemL.disabled = false


func _on_Area_cafe_large_body_entered(body):
	$Area_cafe_large/cafelarge.hide()
	if $Area_cafe_large/CollisionItemL.disabled == false:
		Global.cafeL = Global.cafeL + 1
		print(Global.cafeL)
		$Area_cafe_large/CollisionItemL.disabled = true
	
