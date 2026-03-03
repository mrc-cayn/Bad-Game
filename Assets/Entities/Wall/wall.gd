extends StaticBody2D

@export var target_height : float
@export var tile_size : int = 32
@export var speed : float = 16
var target_scale = Vector2.ONE
var tween : Tween

func  _ready() -> void:
	target_scale = Vector2(1,global_scale.y+(target_height/tile_size)*2)

func activate():

	tween = create_tween().set_parallel(true)
	tween.tween_property($".","scale", target_scale, ((target_scale-scale)*tile_size/speed).y)  
	await tween.finished

func deactivate():
	if tween.is_running():
		tween.kill()
	tween = create_tween().set_parallel(true)
	tween.tween_property($".","scale", Vector2.ONE,((scale-Vector2.ONE)*tile_size/speed).y)  
	pass
