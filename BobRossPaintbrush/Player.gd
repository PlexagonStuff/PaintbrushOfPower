extends KinematicBody2D
onready var rainbow = $"Rainbow"
onready var timer = $Timer
onready var collision = $CollisionShape2D
onready var ross = $Bob
onready var animation = $AnimationPlayer
const ACCELERATION = 700
const MAX_SPEED = 120
const FRICTION = 600
var SPEED = 120
func _ready():
	collision.disabled = false
var velocity = Vector2.ZERO
func _physics_process(delta):
	if Global.mobile == 2:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y= Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		if input_vector != Vector2.ZERO:
		
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		velocity = move_and_slide(velocity)
		
	if Global.mobile == 1:
		var direction = global_position.direction_to(Global.rossPosition)
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
		velocity = move_and_slide(velocity)
		if global_position.x > Global.rossPosition.x && global_position.x < Global.rossPosition.x + 2  :
			SPEED = 0
		else:
			SPEED = 120
	if (Input.is_action_just_pressed("X")):
		Global.x = 1
	if Global.x == 1:
		rainbow.visible = true
		timer.start()
		Global.x = 0
	if (Input.is_action_just_pressed("Z")):
		Global.z = 1
	if Global.z == 1:
		animation.play("Jump")
		Global.z = 0
			

# Replace with function body.


func _on_Timer_timeout():
	rainbow.visible = false
	
	


func _on_AnimationPlayer_animation_finished(Jump):
	animation.play("Idle")
	collision.disabled = false
