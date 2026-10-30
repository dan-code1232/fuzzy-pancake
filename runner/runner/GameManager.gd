
extends Node

@onready var game_over_screen = $"../GameUI/GameOverScreen"
@onready var timer = $ScoreTimer
@onready var timer_label = $"../GameUI/TimerLabel"

var changing_level = false
var ended = false


func _ready():
	game_over_screen.hide()
	timer_label.text = "60"
	timer.start()


func _process(_delta):
	if timer.time_left > 0:
		timer_label.text = str(ceil(timer.time_left))


func game_over():
	if ended or changing_level:
		return

	ended = true
	timer.stop()
	game_over_screen.show()
	get_tree().paused = true



func restart():
	print("RESTART BUTTON PRESSED")

	get_tree().paused = false
	get_tree().reload_current_scene()



func _on_score_timer_timeout():
	game_over()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		level_complete()


func level_complete():
	if ended or changing_level:
		return

	changing_level = true
	timer.stop()

	LevelManager.load_next_level()


func _on_button_pressed() -> void:
	restart()
