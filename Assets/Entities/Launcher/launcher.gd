extends Area2D

#@export var direction :String = ""
@export var dir := Vector2.UP
@onready var arrow: Sprite2D = $arrow

func _ready() -> void:
	if dir == Vector2.UP:
		arrow.global_rotation_degrees = -90
	if dir == Vector2.DOWN:
		arrow.global_rotation_degrees = 90
	if dir == Vector2.LEFT:
		arrow.global_rotation_degrees = 180
	if dir == Vector2.RIGHT:
		arrow.global_rotation_degrees = 0
	#dir = Vector2(dir)
	pass

func _on_body_entered(body:CharacterBody2D) -> void:
	body.velocity += dir*(500)
	print(body)
	print(body.velocity)
	print("fsafat")
	pass # Replace with function body.
