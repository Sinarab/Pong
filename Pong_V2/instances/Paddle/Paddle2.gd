extends KinematicBody2D

export (int) var speed = 150
export (bool) var ai = false
var screen_size
var ai_seeing = 2
var paddle

func _ready():
	screen_size = get_viewport_rect().size
	paddle = get_parent().get_node("Paddle")

func ai_play(delta):
	var ball = get_parent().get_node("Ball")
	var ball_dir
	var collision
	if abs(ball.position.x - paddle.position.x) > abs(position.x - ball.position.x):
		if ball.position.y > position.y + 2:
			ball_dir = +1
			move_and_collide(Vector2(0.0, speed)*delta*ball_dir)
		else:
			ball_dir = -1
			move_and_collide(Vector2(0.0, speed)*delta*ball_dir)
	if collision:
		speed = speed*1.01

func player_input(delta):
	var collision
	if Input.is_action_pressed("move_up_p2"):
		collision = move_and_collide(Vector2(0.0, -speed)*delta)
	elif Input.is_action_pressed("move_down_p2"):
		collision = move_and_collide(Vector2(0.0, speed)*delta)
	if collision:
		speed = speed*1.01

func _physics_process(delta):
	if ai:
		ai_play(delta)
	else:
		player_input(delta)
