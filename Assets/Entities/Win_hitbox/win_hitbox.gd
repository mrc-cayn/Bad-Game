extends Area2D




func _on_body_entered(body:CharacterBody2D) -> void:
	if body.is_in_group("player") and body.is_in_group("immortal") == false:
		print("winnnn")
		print("changing scene",G.Current_level,"-->",G.Current_level+1)
		G.Current_level += 1
		CS.target_path = "res://managers/Scenes/l_"+str(G.Current_level)+".tscn"
		CS.change_scene()
	
	
	if body.is_in_group("player") and body.is_in_group("immortal") == true :
		body.repos()
	pass # Replace with function body.


	
