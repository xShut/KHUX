extends KinematicBody2D

onready var animation_player = $AnimationPlayer
export var speed = 200
var velocity = Vector2()
var last_direction = "_RIGHT"

func _physics_process(delta):
	# Reset velocity
	velocity = Vector2()
	
	# Get input
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	# Normalize velocity
	velocity = velocity.normalized() * speed
	
	# Play animation and change scale
	if velocity.x != 0:
		# Determine direction
		if velocity.x > 0:
			scale = Vector2(1,1)
			last_direction = "_RIGHT"
		elif velocity.x < 0:
			scale = Vector2(-1,1)
			last_direction = "_LEFT"
		
		# Play walking animation in the last horizontal direction
	else:
		# Play idle animation in the last horizontal direction
		animation_player.play("RESET" + last_direction)
	
	# Move the character
	move_and_slide(velocity)
