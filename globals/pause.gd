extends Node

@onready var popup_panel: PopupPanel = $CanvasLayer/PopupPanel


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape") and G.death == false:
		popup_panel.visible = true
		Engine.time_scale = 0
		pass

func _on_button_button_up() -> void:
	popup_panel.visible = false
	Engine.time_scale = 1
	pass # Replace with function body.


func _on_button_2_button_up() -> void:
	popup_panel.visible = false
	CS.target_path = "res://managers/Scene/level_select.tscn"
	CS.change_scene()
	Engine.time_scale = 1
	pass # Replace with function body.


func _on_popup_panel_close_requested() -> void:
	Engine.time_scale = 1
	pass # Replace with function body.
