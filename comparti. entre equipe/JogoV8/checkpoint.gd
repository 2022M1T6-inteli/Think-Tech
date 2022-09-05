extends Area2D

export(Vector2) var checkpoint_position



func _on_checkpoint_body_entered(body):
	if body is KinematicBody2D:
		GlobalData.checkpoint_position = checkpoint_position
		
