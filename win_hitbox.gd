extends Area2D




func _on_body_entered(body:CharacterBody2D) -> void:
	print("winnnn")
	print("changing scene",G.Current_level,"-->",G.Current_level+1)
	G.Current_level += 1
	CS.target_path = "res://managers/Scenes/l_"+str(G.Current_level)+".tscn"
	CS.change_scene()
	pass # Replace with function body.
	
