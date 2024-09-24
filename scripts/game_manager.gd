extends Node

var score = 0
@onready var score_label: Label = $"Score Label"

func add_point():
	score += 1
	print(score)
	
	if score == 1:
		score_label.text = "You collected " + str(score) + " coin!"
	elif (score > 1) or (score == 0):
		score_label.text = "You collected " + str(score) + " coins!"
