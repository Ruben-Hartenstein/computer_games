# name: Ruben Hartenstein
# faculty: Fakultät für Mathematik und Informatik
# dicipline: Data and Computer Science M.Sc.
# student number: 4742423
extends Node

@export 
var Ball: PackedScene

func _input(event):
	if event.is_action_pressed("click"):
		var new_ball = Ball.instantiate()
		new_ball.position = get_viewport().get_mouse_position()
		add_child(new_ball)
