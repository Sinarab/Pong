extends Node2D

var ball
var score2 = 0
var score1 = 0
var hud

func _ready():
	ball = get_parent().get_node("HUD/Ball")
	hud = get_parent().get_node("HUD")

func _on_Goal1_body_exited(body):
	$BallTimer.start()
	score2 += 1
	if score2 == 5:
		hud.update_score(score1,score2)
		score2 = 0
	hud.update_score(score1,score2)

func _on_Goal2_body_exited(body):
	$BallTimer.start()
	score1 += 1
	if score1 == 5:
		hud.update_score(score1,score2)
		score1 = 0
	hud.update_score(score1,score2)

func _on_BallTimer_timeout():
	ball.position = $BallPosition.position
	$BallTimer.stop()
