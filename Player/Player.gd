extends KinematicBody2D

var velocity = Vector2.ZERO
const max_speed = 200
var friction = 10
var acceleration = 10

func _process(delta):
	var input_vector = Vector2.ZERO
	# better code, ok for keyboard and controller
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# nomalizes speed when traveling in diagonal
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:	
		velocity += input_vector * acceleration
		# cap max speed
		velocity = velocity.clamped(max_speed)
	else: # not moving
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	velocity = move_and_slide(velocity) # collide and slide, no delta needed
