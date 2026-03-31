extends Node
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Music/AudioStreamPlayer2D
var player : CharacterBody2D
var Current_level := 1
var death := false
var death_time := 1.5
var moving := false
var current_scene
var temp_death := false


func _ready() -> void:
	
	current_scene = get_tree().current_scene.scene_file_path

func  _process(delta: float) -> void:
	#Engine.time_scale=0
	player = get_tree().get_first_node_in_group("player")
	if get_tree().current_scene != null :
		current_scene = get_tree().current_scene.scene_file_path
		if current_scene != get_tree().current_scene.scene_file_path:
			death = false
			temp_death = false
	if current_scene == "res://managers/Scenes/l_12.tscn" :
		moving = true
	else :
		G.moving = false
	
	print(Engine.time_scale)
	
	if death == true and temp_death == false:
		player.death()
		Engine.time_scale = 0.02
		temp_death = true
		death = false
		await get_tree().create_timer(0.2,true,false,true).timeout
		
		CS.target_path = current_scene
		CS.change_scene()
		
	
	#CHEEEEEEEEEEEEEETSSSSSSSSSSS
	if Input.is_action_just_pressed("ui_page_up"):
		Current_level += 1
		print(Current_level)
	if Input.is_action_just_pressed("ui_page_down"):
		Current_level -= 1
		print(Current_level)


func _on_audio_stream_player_2d_finished() -> void:
	audio_stream_player_2d.play()
	pass # Replace with function body.
