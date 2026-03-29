extends Area2D

#@export var direction :String = ""
@export var dir := Vector2.UP
@export var velocity := 500
@export var velocity_static := 5000
@onready var arrow: Sprite2D = $arrow
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var test : RigidBody2D

func _ready() -> void:
	arrow.global_rotation = dir.angle() + PI/2
	#test.linear_velocity
	pass

func _on_body_entered(body : Node2D) -> void:
	if body.is_in_group("player"):
		animated_sprite_2d.play("default")
		body.velocity = dir*velocity
	if body.is_in_group("target"):
		animated_sprite_2d.play("default")
		body.apply_central_force(dir*velocity_static + body.linear_velocity.rotated(PI))
	
	var r = randi_range(1,3)
	
	if r == 1 :
		$bounce_1.pitch_scale = audio.pitch_shift()
		$bounce_1.play()
	
	if r == 2 :
		$bounce_2.pitch_scale = audio.pitch_shift()
		$bounce_2.play()
	
	if r == 3 :
		$bounce_3.pitch_scale = audio.pitch_shift()
		$bounce_3.play()
	pass # Replace with function body.
