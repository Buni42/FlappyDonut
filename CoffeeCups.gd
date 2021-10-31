extends KinematicBody2D

const SCREEN_W = 1024
const SCREEN_H = 600
const MAX_speed = -600

var RandomInt = RandomNumberGenerator.new()
var velocity = Vector2()
var speed = 0

export (int) var in_editor_speed = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	RandomInt.randomize()
#		all for debug;
#	print(self.position)
#	print(velocity)
#	print(RandomInt.randi_range(100,500))


func _physics_process(_delta):
	var pos_reset: bool = false
	
	if self.position.x <= -SCREEN_W:
		pos_reset = true
		self.position.x = SCREEN_W + 64
	else:
		velocity.x -= speed
		if velocity.x<=MAX_speed:
			velocity.x = MAX_speed
	
	if pos_reset:
		RandomInt.randomize()
		self.position.y = RandomInt.randi_range(100,500)
		
#	print(velocity.x)#debug
	move_and_slide(velocity)



func _on_up_body_entered(body):
	
	if body.has_method("death"):
		get_tree().change_scene("res://scenes/restart_level.tscn")
		set_physics_process(false)
		body.set_physics_process(false)


func _on_bottom_body_entered(body):

	if body.has_method("death"):
		get_tree().change_scene("res://scenes/restart_level.tscn")
		set_physics_process(false)
		body.set_physics_process(false)
