extends Area2D



func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player") and body.is_in_group("immortal") == false:
		G.death = true
		print("l+ratio")
	pass # Replace with function body.
