extends Area2D

const colors = ['red', 'green', 'blue']

var dragging = false
var anchor
var color = 'red'
var dead = false

func _process(delta):
	if position.y > 840:
		anchor.taken = false
		dead = true
		if position.x == 80:
			if color == 'red':
				Global.score += 10
			else:
				Global.health -= 1
		elif position.x == 240:
			if color == 'blue':
				Global.score += 10
			else:
				Global.health -= 1
		elif position.x == 400:
			if color == 'green':
				Global.score += 10
			else:
				Global.health -= 1
			pass
		queue_free()
	elif dragging:
		set_position(get_viewport().get_mouse_position())
	elif anchor != null:
		set_position(anchor.global_position)

func _on_Duck_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		dragging = event.is_pressed()
		if dragging:
			play_sound()
			$AnimationPlayer.play("PickedUp")
		else:
			$AnimationPlayer.play("PickedDown")

func _on_Duck_body_entered(body):
	if body.is_in_group('conv_point') and !body.taken and !dead:
		if anchor != null:
			anchor.taken = false
		anchor = body
		anchor.taken = true

func play_sound():
	if color == 'red':
		$RedSound.play()
	elif color == 'blue':
		$BlueSound.play()
	elif color == 'green':
		$GreenSound.play(0.4)
			
func set_random_color():
	randomize()
	var id:int = randi() % colors.size()
	if colors[id]:
		color = colors[id]
		if color == 'red':
			$DuckSprite/Red.set_visible(true)
		elif color == 'blue':
			$DuckSprite/Blue.set_visible(true)
		elif color == 'green':
			$DuckSprite/Green.set_visible(true)
