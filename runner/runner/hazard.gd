extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Hazard touched by: ", body.name)

	if body.is_in_group("player"):
		print("PLAYER DETECTED")
		get_tree().call_group("game_manager", "game_over")
