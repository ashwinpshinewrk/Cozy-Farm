extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
var motion := Vector2.ZERO
var direction := 1.0

const UP := Vector2(0,-1)
const SPEED := 2000
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = direction * SPEED * delta
	move_and_slide()
	if is_on_wall():
		direction *=-1
		get_node("chickens2").flip_h = !get_node("chickens2").flip_h
