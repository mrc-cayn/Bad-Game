extends TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var target_path : String

func change_scene():
	#animation_player.play("change_scene")
	print("changing scene to ",target_path)
	get_tree().change_scene_to_file(target_path)

func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_page_up"):
		target_path = "res://main.tscn"
		change_scene()
