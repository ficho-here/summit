extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x = input_direction * speed
	
	if input_direction > 0:
		velocity.y = input_direction * -speed 
	else:
		velocity.y = input_direction * speed
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
