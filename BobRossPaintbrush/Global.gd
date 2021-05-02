extends Node2D
var rossPosition = Vector2.ZERO
var mobile = 1
var x = 0
var z = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		rossPosition = get_global_mouse_position()
