extends TextureButton

@export var target_scene_path : String      
@export var level_select := false

func _on_button_up() -> void:
	if level_select == true :
		var target_level := name 
		CS.target_path = "res://managers/Scenes/l_" + str(target_level) + ".tscn"
		G.Current_level = int(target_level)
		print(CS.target_path)
		CS.change_scene()
	else:
		CS.target_path = target_scene_path
		CS.change_scene()
	pass # Replace with function body.
