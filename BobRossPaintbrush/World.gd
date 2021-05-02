extends Node2D
onready var button = $CanvasLayer/Button
onready var button2 = $CanvasLayer/Button2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.mobile == 1:
		button.visible = true
		button2.visible = true
	else:
		button.visible = false
		button2.visible = false


func _on_Button_pressed():
	Global.x = 1# Replace with function body.


func _on_Button2_pressed():
	Global.z = 1 # Replace with function body.
