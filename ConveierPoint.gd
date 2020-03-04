extends KinematicBody2D

export(String, '#FF3333', '#33FF36', '#00A6FF') var color = '#FF3333'

var velocity = Vector2.ZERO
var taken = false

func _ready():
	$Dot.modulate = Color(color)
#	$AnimationPlayer.play("blinking")

func _process(delta):
	velocity = Vector2.ZERO
	
	if position.y > 840:
		set_position(Vector2(position.x, -40))
	
	velocity.y += Global.level_speed
	velocity = move_and_slide(velocity)
