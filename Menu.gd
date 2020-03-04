extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.hi_score > 0:
		$VBoxContainer/GameOver.set_visible(true)
		$VBoxContainer/HiScore.text = 'Hi-Score: ' + str(Global.hi_score)
		$VBoxContainer/HiScore.set_visible(true)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	Global.reset()
	get_tree().change_scene("res://Main.tscn")
