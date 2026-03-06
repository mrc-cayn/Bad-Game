extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer
@export var friction :float = 0.8
@export var speed:float = 0.5
@export var jump_velocity:int = 4
@export var time:float = 1
@export var gravity:int = 5
var orignal_speed = 0
var dir : Vector2 = Vector2.ZERO

func  _ready() -> void:
	timer.wait_time = time
	timer.start()
	orignal_speed = speed

func _process(delta: float) -> void:
	distance(200,1.5)
	distance(300,1.3)
	distance(500,1.2)
	#print(position.distance_to(get_global_mouse_position()))
	pass

func distance(distance,increment):
		if position.distance_to(get_global_mouse_position()) < distance :
			speed = orignal_speed + (orignal_speed * increment)

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

func _on_timer_timeout() -> void:
	if is_on_floor():
		velocity.y -= jump_velocity * gravity
	velocity.x += randi_range(-1,1) * speed 
	#print("g")
	timer.wait_time = 1 + randfn(1.5,1)
	pass # Replace with function body.
