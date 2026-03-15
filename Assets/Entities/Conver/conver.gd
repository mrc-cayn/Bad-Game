extends Area2D
@onready var player: NodePath= get_tree().get_first_node_in_group("player").get_path()
@onready var poison: NodePath= get_tree().get_first_node_in_group("target").get_path()
@export var force : int = 5
@export var force_static : int = 100
@export var dir : Vector2 = Vector2.LEFT
@export var active : bool = true
var target = []
var is_colliding :bool = false

func _process(delta: float) -> void:
	move()
	pass

func move() :
	if active == true and is_colliding == true :
		for i in target :
			if i == get_node(player):
				get_node(player).velocity.x += dir.x  * force
				#print(target)
			if i == get_node(poison):
				get_node(poison).apply_central_force(Vector2(dir.x * force_static,0))
				#print(target)
	pass


func  activate():
	active = true
	dir = dir.rotated(1*PI)

func  deactivate():
	active = true
	dir = dir.rotated(1*PI)

func _on_area_entered(area: Area2D) -> void:
	is_colliding = true
	if area.is_in_group("player"):
		target.append(get_node(player))
	if area.is_in_group("target"):
		target.append(get_node(poison))
	print("enter")

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		target.erase(get_node(player))
	if area.is_in_group("target"):
		target.erase(get_node(poison))
	print("exit")
	pass # Replace with function body.
