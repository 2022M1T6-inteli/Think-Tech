extends Area2D

var player_ref

func _on_bau_body_entered(body):
	if body.is_in_group("Player_"):
		player_ref = body

func _on_bau_body_exited(body):
	if body.is_in_group("Player_"):
		player_ref = null

func _physics_process(_delta):
	if Input.is_action_just_pressed("Open") and player_ref != null:
		$AnimatedSprite.play("aberto")
		$Open.play()
		$AnimatedSprite.hide()
		$Area_cafe/cafe.show()
		player_ref.key = false
		$Collision_bau.disabled = true


func _on_Area_cafe_body_entered(body):
	if $Area_cafe/CollisionItemM.disabled == false:
		Global.cafeM = Global.cafeM + 1
		print(Global.cafeM)
	$Area_cafe/cafe.hide()
	$Area_cafe/CollisionItemM.disabled = true
	

	
	
	
