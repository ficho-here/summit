extends CharacterBody2D
@onready var move_timer = $MoveTimer
@onready var timer = $Timer
@export var speed = 1000
@export var can_jump = true
var is_hanging = true
var first_jump = false
var current_ledge: Area2D = null
var jump_count = 0
@onready var main_node = get_parent() 
func get_input():
	
	
	if jump_count < 0 or jump_count >= main_node.ledge_direction.size():
		return
		
		
	if Input.is_action_just_pressed("right") and main_node.ledge_direction[jump_count] == "R":
		first_jump = true
		jump_count += 1
		velocity.y = -speed 
		velocity.x = speed
		is_hanging = false
		trigger_jump()

	elif Input.is_action_just_pressed("left") and main_node.ledge_direction[jump_count] == "L":
		jump_count += 1
		velocity.y = -speed
		velocity.x = -speed
		is_hanging = false
		trigger_jump()

func _physics_process(delta: float) -> void:
	if is_hanging == true:
		get_input()
	move_and_slide()
	
		
func trigger_jump():
	can_jump = false
	timer.start()
	

func _on_timer_timeout() -> void:
	can_jump = true
	velocity.x = 0
	velocity.y = 0
	
func teleport_to_ledge(ledge: Area2D):
	is_hanging = true
	global_position = ledge.global_position
	velocity = Vector2.ZERO
	
func get_first_jump():
	return first_jump
	
	
	
	
	
	
