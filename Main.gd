extends Node2D

const Duck = preload('res://Duck.tscn')

var spawn_position = [Vector2(80, -40), Vector2(240, -40), Vector2(400, -40)]

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_duck()
	spawn_duck()
	spawn_duck()
	$Timer.start(Global.spawn_seconds)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.health <= 0:
		get_tree().change_scene("res://Menu.tscn")

func spawn_duck():
	randomize()
	var id:int = randi() % spawn_position.size()
	if spawn_position[id]:
		var duck = Duck.instance()
		duck.set_position(spawn_position[id])
		duck.set_random_color()
		$Ducks.add_child(duck)
		
	

func _on_Timer_timeout():
	for i in range(Global.level + 2):
		spawn_duck()
	$Timer.start(Global.spawn_seconds)
