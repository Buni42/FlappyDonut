extends Node2D

onready var donut = get_node("donut/KinematicBody2D")
onready var text = get_node("menu/MarginContainer/VBoxContainer/start/text")
onready var cups = get_node("CoffeeCups")
onready var bum = get_node("donut/KinematicBody2D/bum")
onready var score = get_node("score")


func _input(event):
	if event.is_action_pressed("start"):
		text.set_deferred("visible", false)
		# you can set the gravity, up value in the editor
		donut.gravity = donut.in_editor_gravity 
		donut.up = donut.in_editor_up
		cups.speed = cups.in_editor_speed 
		bum.emitting = true



func _on_entered_body_entered(_body: Node) -> void:
	score.score += 1
#	print(score)
