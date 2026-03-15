extends Area2D

#@export var direction :String = ""
@export var dir := Vector2.UP
@export var velocity := 500
@export var velocity_static := 5000
@onready var arrow: Sprite2D = $arrow

func _ready() -> void:
	arrow.global_rotation = dir.angle()

	#dir = Vector2(dir)
	pass

func _on_body_entered(body : Node2D) -> void:
	if body.is_in_group("player"):
		body.velocity += dir*velocity
	if body.is_in_group("target"):
		body.apply_central_force(dir*velocity_static)
	pass # Replace with function body.
