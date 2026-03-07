extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@export var friction :float = 2
@export var speed:float = 2
@export var max_speed:float = 150
@export var jump_velocity:int = 4
@export var time:float = 1
@export var gravity:int = 5
var orignal_speed = 0
var orignal_max_speed = 0
var dir : Vector2 = Vector2.ZERO

func  _ready() -> void:
	timer.wait_time = time
	timer.start()
	orignal_speed = speed
	orignal_max_speed = max_speed

func _process(delta: float) -> void:
	distance(50,1.4)
	distance(60,1.3)
	distance(80,1.2)
	distance(100,0.9)
	distance(120,0.8)
	distance(150,0.6)
	distance(200,0.1)
	print(position.distance_to(get_global_mouse_position()))
	pass

func distance(distance,increment):
		if position.distance_to(get_global_mouse_position()) < distance :
			speed = orignal_speed + (orignal_speed * increment)
			max_speed = orignal_max_speed + (orignal_max_speed * increment)

func  _physics_process(delta: float) -> void:
	dir = position.direction_to(get_global_mouse_position())
	#print(dir)
	move()
	if is_on_floor():
		velocity.x = lerp(velocity.x,0.0,friction*delta)
	move_and_slide()




func move():
	if is_on_floor() == false:
		velocity.y += gravity
		velocity.x += dir.x * speed
	if is_on_floor():
		velocity.x += dir.x * speed
		velocity.x = min(velocity.x,max_speed)
		velocity.x = max(velocity.x,-max_speed)



func _on_timer_timeout() -> void:
	if is_on_floor():
		velocity.y -= jump_velocity * gravity
	velocity.x += randi_range(-1,1) * speed 
	#print("g")
	timer.wait_time = 1 + randfn(1.2,1)
	pass # Replace with function body.


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") == false :
		G.death = true
		pass
	pass # Replace with function body.
