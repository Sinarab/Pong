extends KinematicBody2D

export var speed = Vector2(250.0,0.0)
var randomAngle
var start = false
var rebound_intensity = 100

func _ready():
	randomAngle = rand_range(5.0,15.0)
	speed = speed.rotated((deg2rad(randomAngle)))
	
func _physics_process(delta):
	var stop = Vector2(0.0,0.0)
	if start:
		var collision = move_and_collide(speed*delta)
		if collision:
			if collision.collider.is_in_group("walls"):
				speed.y *= -1
			if collision.collider.is_in_group("paddles"):
				speed.x *= -1
				speed.y = y_from_collision(collision)
#				randomAngle = rand_range(5.0,15.0)
				speed = speed*1.02
	else:
		move_and_collide(stop)

func y_from_collision(collision):
	var paddle_y_extent = collision.collider.get_node("CollisionShape2D").shape.extents.y
	var val_normalized = (position.y - collision.collider.position.y)/paddle_y_extent
	return val_normalized * rebound_intensity
