extends StaticBody2D

@export var target_height : float
@export var tile_size : int = 32
@export var speed : float = 16

var target_scale = Vector2.ONE

func  _ready() -> void:
	target_scale = Vector2(1,global_scale.y+(target_height/tile_size)*2)

func activate():
	var tween = create_tween()
	tween.tween_property($".","scale", target_scale, target_height/speed)   

func deactivate():
	var tween = create_tween()
	tween.tween_property($".","scale",Vector2.ONE, target_height/speed)   
