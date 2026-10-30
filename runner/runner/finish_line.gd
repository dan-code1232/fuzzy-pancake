extends Area2D

var finished := false

func _on_body_entered(body: Node2D) -> void:
	if finished:
		return

	if body.is_in_group("player"):
		finished = true
		get_tree().call_group("game_manager","level_complete")
