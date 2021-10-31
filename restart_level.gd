extends Control

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("again"):
		get_tree().change_scene("res://scenes/Main.tscn")
	if Input.is_action_pressed("exit"):
		get_tree().quit()
