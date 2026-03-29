extends Area2D




func _on_body_entered(body:CharacterBody2D) -> void:
	if body.is_in_group("player") and body.is_in_group("immortal") == false:
		print("winnnn")
		print("changing scene",G.Current_level,"-->",G.Current_level+1)
		G.Current_level += 1
		CS.target_path = "res://managers/Scenes/l_"+str(G.Current_level)+".tscn"
		CS.change_scene()
		
		var r = randi_range(1,4)
		if r == 1 :
			$win.pitch_scale = audio.pitch_shift()
			$win.play()
		if r == 3 :
			$win_1.pitch_scale = audio.pitch_shift()
			$win_1.play()
		if r == 2 :
			$win_2.pitch_scale = audio.pitch_shift()
			$win_2.play()
		if r == 4 :
			$win_3.pitch_scale = audio.pitch_shift()
			$win_3.play()
	if body.is_in_group("player") and body.is_in_group("immortal") == true :
		body.repos()
	pass # Replace with function body.


	
