extends CanvasLayer

func new_match():
	$Tittle.show()
	$Start.show()
	$Start2.show()
	$Paddle2.ai = false
	$Ball.start = false
	$Score1.text = "0"
	$Score2.text = "0"

func _on_Start_pressed():
	$Ball.start = true
	$Ball.speed = Vector2(250.0,0.0)
	$Paddle.speed = 150
	$Paddle2.speed = 150
	$Paddle2.ai = true
	$Start.hide()
	$Start2.hide()
	$Tittle.hide()
	$Ball/Sprite.show()

func _on_Start2_pressed():
	$Ball.start = true
	$Ball.speed = Vector2(250.0,0.0)
	$Paddle.speed = 150
	$Paddle2.speed = 150
	$Paddle2.ai = false
	$Start.hide()
	$Start2.hide()
	$Tittle.hide()
	$Ball/Sprite.show()

func update_score(score1,score2):
	$Score1.text = str(score1)
	$Score2.text = str(score2)
	if score2 == 5:
		new_match()
	elif score1 == 5:
		new_match()
		
