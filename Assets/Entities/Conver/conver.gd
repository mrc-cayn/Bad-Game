extends Area2D
@onready var player: NodePath= get_tree().get_first_node_in_group("player").get_path()
@export var force : int = 50
@export var dir : Vector2 = Vector2.LEFT
@export var active : bool = true
var is_colliding :bool = false

func _process(delta: float) -> void:
	if active == true and is_colliding == true :
		get_node(player).velocity.x = dir.x  * force
		print("lol ")
		pass


func  activate():
	active = true
	dir = dir.rotated(1*PI)

func  deactivate():
	active = true
	dir = dir.rotated(1*PI)

func _on_area_entered(area: Area2D) -> void:
	is_colliding = true
	print("losjgdg")
	pass # Replace with function body.

func _on_area_exited(area: Area2D) -> void:
	is_colliding = false
	pass # Replace with function body.
