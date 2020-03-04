extends Node

const speed_mod = 2
var level_increase = [30, 60, 180, 400, 600, 1000, 1500, 2500, 5000]
var level_speed = 30

var spawn_seconds = 8

const max_level = 10
var level = 1

var hi_score = 0
var score = 0

var health = 3

func increase_level():
	if level < max_level:
		level += 1
		level_speed += speed_mod + level

func _process(delta):
	if level_increase.has(score):
		level_increase.pop_front()
		increase_level()
	if health == 0:
		if score > hi_score:
			hi_score = score

func reset():
	level = 1
	score = 0
	health = 3
	level_speed = 30
	level_increase =  [30, 60, 180, 400, 600, 1000, 1500, 2500, 5000]
