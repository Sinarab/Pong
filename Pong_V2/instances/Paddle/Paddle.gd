extends KinematicBody2D

export (int) var speed = 150

func _physics_process(delta):
	var collision
	if Input.is_action_pressed("move_up_p1"):
		collision = move_and_collide(Vector2(0.0, -speed)*delta)
	elif Input.is_action_pressed("move_down_p1"):
		collision = move_and_collide(Vector2(0.0, speed)*delta)
	if collision:
		speed = speed*1.01
	

