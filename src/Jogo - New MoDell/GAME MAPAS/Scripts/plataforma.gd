extends Node2D

onready var plat = $plat
onready var tween = $Tween

export var speed = 50.0
export var horizontal = true
export var distance = 200
const wait_duratin = 1.0
var follow = Vector2.ZERO

func _ready():
	_start()
	
func _start():
	var move_direction = Vector2.RIGHT * distance if horizontal else Vector2.UP * distance
	var duration = move_direction.length()/ float(speed * 8)
	tween.interpolate_property(
		self, "follow", Vector2.ZERO, move_direction, duration,
		Tween.TRANS_LINEAR, tween.EASE_IN_OUT, wait_duratin
	)
	tween.interpolate_property(
		self, "follow", move_direction, Vector2.ZERO, duration,
		Tween.TRANS_LINEAR, tween.EASE_IN_OUT,duration + wait_duratin * 2
	)
	tween.start()
	
func _physics_process(delta: float) -> void:
	plat.position = plat.position.linear_interpolate(follow, 0.05)
