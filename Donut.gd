extends KinematicBody2D

export (float) var in_editor_gravity = 0.2
export (int) var in_editor_up = 5

var gravity = 0
var up = 0
const MAX_fallspeed = 50
const MAX_upspeed = -10

var velocity = Vector2()

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("up"):
		velocity.y -= up
		if velocity.y < MAX_upspeed:
			velocity.y = MAX_upspeed

func _physics_process(_delta):
	velocity.y += gravity
	if velocity.y > MAX_fallspeed:
		velocity.y = MAX_fallspeed
	move_and_collide(velocity)


func death():
	pass
