extends Node

var Current_level := 1
var death := false
var death_time := 1.5
func  _process(delta: float) -> void:
	if death == true:
		Engine.time_scale = 0.05
		await get_tree().create_timer(1.5,true,false,true).timeout
		get_tree().reload_current_scene()
		Engine.time_scale = 1
