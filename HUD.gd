extends Control

func _process(delta):
	$Panel/VBoxContainer/Score.text = 'Score: ' + str(Global.score)
	$Panel/VBoxContainer/HBoxContainer/Level.text = 'Level: ' + str(Global.level) + '/10'
	$Panel/VBoxContainer/HBoxContainer/Health.text = 'Chances: ' + str(Global.health) + '/3'
