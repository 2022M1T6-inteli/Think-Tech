extends Panel



func _ready():
	var anim_sprite: AnimatedSprite = $AnimatedSprite
	anim_sprite.play()
func _process(delta):
	$Label.text = str(Checkpoint.coinsCollected)
	$Coffe.text = str(Global.cafeL)
