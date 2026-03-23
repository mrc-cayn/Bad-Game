extends Node

var Current_level := 1
var death := false
var death_time := 1.5
var moving := false
func  _process(delta: float) -> void:
	if get_tree().current_scene.scene_file_path == "res://managers/Scenes/l_11.tscn" :
		moving = true
		
	if death == true:
		Engine.time_scale = 0.2
		await get_tree().create_timer(1.5,true,false,true).timeout
		get_tree().reload_current_scene()
		Engine.time_scale = 1
		death = false
	
	#CHEEEEEEEEEEEEEETSSSSSSSSSSS
	if Input.is_action_just_pressed("ui_page_up"):
		Current_level += 1
		print(Current_level)
	if Input.is_action_just_pressed("ui_page_down"):
		Current_level -= 1
		print(Current_level)
