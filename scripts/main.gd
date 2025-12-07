extends Node2D


@onready var ledge = $map1/Area2D 
@onready var map1 = $map1

func _ready() -> void:
	
	var first_ledge = ledge.duplicate()
	first_ledge.global_position = Vector2(0, -200)
	map1.add_child(first_ledge)
	
	create_ledge(0, -200, 100)


func create_ledge(xp: float, yp: float, count: int):
	
	var randpos = randi_range(1, 2)
	if count == 0:
		return
			
	var another_ledge = ledge.duplicate()
	
	if randpos == 1:
		another_ledge.global_position = Vector2(xp+100, yp-100)
		map1.add_child(another_ledge)
		create_ledge(xp+100, yp-100, count-1)
	else: 
		another_ledge.global_position = Vector2(xp-100, yp-100)
		map1.add_child(another_ledge)
		create_ledge(xp-100, yp-100, count-1)
		
	
	
	
	
	
