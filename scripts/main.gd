extends Node2D


@onready var ledge = $map1/Area2D
@onready var map1 = $map1
@onready var water = $Water
@onready var player = $player
@export var count_ledges = 100
@onready var bar = $player/Camera2D/ProgressBar
var ledge_direction: Array[String] = ["R", "L"]

func _ready() -> void:

	bar.max_value = count_ledges
	var first_ledge = ledge.duplicate()
	first_ledge.global_position = Vector2(0, -206)
	map1.add_child(first_ledge)
	create_ledge(0, -206, count_ledges-2)

	print(ledge_direction)

func _process(delta: float) -> void:
	if player.get_first_jump() == true:
		water.position.y -= 2

func create_ledge(xp: float, yp: float, count: int):

	var randpos = randi_range(1, 2)
	if count == 0:
		return

	var another_ledge = ledge.duplicate()

	if randpos == 1:
		ledge_direction.append("R")
		another_ledge.global_position = Vector2(xp+100, yp-106)
		map1.add_child(another_ledge)
		create_ledge(xp+100, yp-106, count-1)

	elif randpos == 2:
		ledge_direction.append("L")
		another_ledge.global_position = Vector2(xp-100, yp-106)
		map1.add_child(another_ledge)
		create_ledge(xp-100, yp-106, count-1)
