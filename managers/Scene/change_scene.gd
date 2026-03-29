extends Node
var target_path : String
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var current_scene

func change_scene():
	
	animation_player.play("open")
	print("changing scene to ",target_path,$AnimationPlayer)
	Engine.time_scale = 0.01
	await  animation_player.animation_finished
	Engine.time_scale = 1
	get_tree().change_scene_to_file(target_path)
	Engine.time_scale = 1
	G.temp_death = false

func _process(delta) -> void:
	
	if G.moving == true :
		var camera_2d: Camera2D = $AnimationPlayer2/Camera2D
		reparent(camera_2d)
	
	animation_player.speed_scale = 1/Engine.time_scale
	if get_tree().current_scene != current_scene :
		if animation_player != null and animation_player.is_playing() == false:
			current_scene = get_tree().current_scene
			#print("play")
			Engine.time_scale = 0.01
			animation_player.play("close")
			await  animation_player.animation_finished
			Engine.time_scale = 1
			#await  animation_player.animation_finished
	if Input.is_action_just_released("ui_page_up"):
		target_path = "res://main.tscn"
		change_scene()
