extends CharacterBody2D
@onready var move_timer = $MoveTimer
@onready var timer = $Timer
@export var speed = 1000
@export var can_jump = true
func get_input():
	if Input.is_action_just_pressed("right") and can_jump:
		velocity.y = -speed 
		velocity.x = speed
		trigger_jump()

	elif Input.is_action_just_pressed("left") and can_jump:
		velocity.y = -speed
		velocity.x = -speed
		trigger_jump()

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
		
func trigger_jump():
	can_jump = false
	timer.start()
	

func _on_timer_timeout() -> void:
	can_jump = true
	velocity.x = 0
	velocity.y = 0
	
func teleport_to_ledge(ledge_pos: Vector2):
	global_position = ledge_pos
	velocity = Vector2.ZERO
	
	
	
