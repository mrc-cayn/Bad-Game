extends Area2D

#@export var direction :String = ""
@export var dir := Vector2.UP
@export var velocity := 500
@onready var arrow: Sprite2D = $arrow

func _ready() -> void:
	arrow.global_rotation = dir.angle()

	#dir = Vector2(dir)
	pass

func _on_body_entered(body:CharacterBody2D) -> void:
	body.velocity += dir*velocity
	pass # Replace with function body.
