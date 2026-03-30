extends TextureButton
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var target_scene_path : String      
@export var level_select := false

func _on_button_up() -> void:
	audio_stream_player_2d.pitch_scale = audio.pitch_shift()
	audio_stream_player_2d.play()
	
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


func _on_button_down() -> void:
	audio_stream_player_2d.pitch_scale = audio.pitch_shift()
	audio_stream_player_2d.play()
	pass # Replace with function body.
