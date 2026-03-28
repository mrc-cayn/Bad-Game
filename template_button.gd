extends Button
@export var target_scene_path : String      

func _on_button_up() -> void:
	CS.target_path = target_scene_path
	CS.change_scene()
	pass # Replace with function body.
