extends CanvasLayer

signal start_game
signal end_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the\nCreeps"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func update_health(hearts):
	$Heart.show()
	if hearts >= 3 :
		hearts = 3
	$Heart.rect_size.x = hearts * 2000
	if hearts == 0 :
		$Heart.hide()
		emit_signal("end_game")
		
