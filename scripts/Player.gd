extends CharacterBody2D

@export var speed = 3500

var anim_direction = "down_idle"
var temp_dir =  "down_idle"
var last_dir = "down"
const format_str = "%s_idle"

@onready var anim = $Sprite2D/AnimationPlayer

func _ready():
	anim.play("down_idle")

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = input_direction * speed * delta
	return input_direction

func animation_loop(input_dir):
	match input_dir:
		Vector2(-1,0):
			anim_direction = "left_walk"
			last_dir = "left"
		Vector2(1,0):
			anim_direction = "right_walk"
			last_dir = "right"
		Vector2(0,1):
			anim_direction = "down_walk"
			last_dir = "down"
		Vector2(0,-1):
			anim_direction = "up_walk"
			last_dir = "up"
		Vector2(-1,-1):
			anim_direction = "up_walk"
			last_dir = "up"
		Vector2(1,-1):
			anim_direction = "up_walk"
			last_dir = "up"
		Vector2(-1,1):
			anim_direction = "down_walk"
			last_dir = "down"
		Vector2(1,1):
			anim_direction = "down_walk"
			last_dir = "down"
		Vector2(0,0):
			anim_direction = format_str % last_dir
	

func _physics_process(delta):
	var input_dir = get_input(delta)
	animation_loop(input_dir)
	if anim_direction != temp_dir:
		anim.play(anim_direction)
	temp_dir = anim_direction
	move_and_slide()
