extends StaticBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var target_height : float
@export var tile_size : int = 32
@export var time : float = 1
@export var target_scale = Vector2.ONE
@export var auto_active := false
var orignal_height := 0.0
var orignal_scale : Vector2

func  _ready() -> void:
	target_scale = Vector2(scale.x,(scale.y*tile_size+target_height)/tile_size)
	orignal_height = position.y
	orignal_scale = scale
	if auto_active == true:
		activate()

func _process(delta: float) -> void:
	pass


func activate():
	#print(animation_player.get_animation("activate").track_get_key_value(0,1))
	#animation_player.get_animation("RESET").track_set_key_value(0,0,scale)
	#animation_player.get_animation("activate").track_set_key_value(0,0,scale)
	#animation_player.get_animation("activate").track_set_key_value(0,1,target_scale)
	#animation_player.get_animation("activate").track_set_key_time(0,1,((target_scale.y-scale.y)/target_scale.y)*time)
	#animation_player.play("activate")
	#print(animation_player.get_animation("activate").track_get_key_value(0,1))
	pass
	var tween = create_tween().set_parallel(true)
	tween.tween_property($".","scale", target_scale,((target_scale.y-scale.y)/target_scale.y)*time)  
	await tween.finished
	#scale = target_scale


func deactivate():
	#print(animation_player.get_animation("activate").track_get_key_value(0,1))
	
	#animation_player.get_animation("activate").track_set_key_time(0,1,((orignal_scale.y-scale.y)/orignal_scale.y)*time)
	#animation_player.play_backwards("activate")
	#print(animation_player.get_animation("activate").track_get_key_value(0,1))
	var tween = create_tween().set_parallel(true)
	tween.tween_property($".","scale",orignal_scale,time)  
	pass
